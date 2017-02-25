=begin
Copyright 2017 Alessandro Profiti, Gabriele Restuccia, Lorenzo Ricelli.

This file is part of PagoChiNonPaga.

PagoChiNonPaga is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

PagoChiNonPaga is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.
=end

class TitolariController < ApplicationController
  before_action :set_titolare, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_utente!, except: [:new,:create]
  before_filter :controllo_id_titolare, except:  [:new,:create]
  before_filter :controllo_ordini_titolare, only: :destroy


  # GET /titolari/:id
  # GET /titolari/:id.json
  def show
  end

  # GET /titolari/new
  def new
    if utente_signed_in?
      redirect_to :back
    end
    @titolare = Titolare.new
  end

  # GET /titolari/:id/edit
  def edit
  end

  # POST /titolari
  # POST /titolari.json
  def create
    # Se per indirizzo, ho utilizzato l'autocompletiton, seleziono automaticamente la citta corrispondente
    # Salvo il record nel DB
    @titolare = Titolare.new(titolare_params)
    respond_to do |format|
      if @titolare.save
        #CustomMailer.titolare_creato(@titolare).deliver_now
        format.html { redirect_to @titolare, notice: 'Titolare was successfully created.' }
        format.json { render :show, status: :created, location: @titolare }
      else
        format.html { render :new }
        format.json { render json: @titolare.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /titolari/:id
  # PATCH/PUT /titolari/:id.json
  def update
    # Se per indirizzo, ho utilizzato l'autocompletiton, seleziono automaticamente la citta corrispondente
    # Salvo il record nel DB
    respond_to do |format|
      params.delete [:sesso,:citta_nascita]
      puts(titolare_params)
      ret = @titolare.update(titolare_params)
      if ret
        format.html { redirect_to @titolare, notice: 'Titolare was successfully updated.' }
        format.json { render :show, status: :ok, location: @titolare }
      else
        Rails.logger.info(@titolare.errors.messages.inspect)
        format.html { render :edit }
        format.json { render json: @titolare.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /titolari/:id
  # DELETE /titolari/:id.json
  def destroy
    #@titolare.congelato = true;
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Account disabilitato con successo.' }
      format.json { head :no_content }
    end
  end

  private
    def controllo_id_titolare
      if !(current_utente.actable_id==params[:id].to_i && current_utente.isTitolare?)
        redirect_back
      end
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_titolare
      @titolare = Titolare.find(params[:id])
    end

    # Controlla almeno una impresa del titolare ha degli ordini attivi
    def controllo_ordini_titolare
      imprese = @titolare.imprese
      # Itero nelle varie imprese
      imprese.each do |impresa|
        ordini = impresa.getOrdiniAttivi
        if !ordini.empty?
          # Ho degli ordini attivi in almeno una impresa
          # Non elimino il profilo
          flash[:error] = "Ordini in sospeso. Impossibile eliminare il tuo profilo"
          return redirect_back
        end
      end

    end

    def titolare_params
      params.require(:titolare).permit(:nome,:cognome,:cf,:data_nascita,:telefono,:email,:piva,:actable_id,:actable_type,:password,:password_confirmation,:indirizzo, :descrizione_indirizzo, :citta_id,:email_paypal, :locality, :route,:administrative_area_level_1,:administrative_area_level_2,:administrative_area_level_3,:neighborhood,:country,:sesso,:citta_nascita)
    end
end
