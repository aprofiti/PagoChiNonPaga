class ClientiController < ApplicationController
  before_action :set_cliente, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_utente! , except: [:new,:create]
  before_filter :controllo_id_cliente, except: [:new, :create]
  before_filter :controllo_ordini_cliente, only: :destroy

  # GET /clienti/:id
  # GET /clienti/:id.json
  def show
  end

  # GET /clienti/new
  def new
    if utente_signed_in?
      redirect_to :back
    end
    @cliente = Cliente.new
  end

  # GET /clienti/:id/edit
  def edit
  end

  # POST /clienti
  # POST /clienti.json
  def create
    @cliente = Cliente.new(cliente_params)
    respond_to do |format|
      if @cliente.save
        format.html { redirect_to @cliente, notice: 'Cliente was successfully created.' }
        format.json { render :show, status: :created, location: @cliente }
      else
        format.html { render :new }
        format.json { render json: @cliente.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clienti/:id
  # PATCH/PUT /clienti/:id.json
  def update

    respond_to do |format|
      if @cliente.update(cliente_params)
        format.html { redirect_to @cliente, notice: 'Cliente was successfully updated.' }
        format.json { render :show, status: :ok, location: @cliente }
      else
        format.html { render :edit }
        format.json { render json: @cliente.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clienti/:id
  # DELETE /clienti/:id.json
  def destroy
    @cliente.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Cliente was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    #controlla che current_utente è di tipo Cliente e con l'id che cerca di visualizzare
    def controllo_id_cliente
      if !(current_utente.actable_id==params[:id].to_i && current_utente.isCliente?)
        redirect_back
      end
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_cliente
      @cliente = Cliente.find(params[:id])
    end

    def controllo_ordini_cliente
      ordini = @cliente.getOrdini
      ordini.each do |ordine|
        if  [StatoOrdine.SPEDITO,StatoOrdine.PAGATO].include? ordine.getStato
          flash[:error] = "Ordini in sospeso. Impossibile eliminare il tuo profilo"
          return redirect_back
        end
      end
    end

    def cliente_params
      params.require(:cliente).permit(:nome,:cognome,:cf,:data_nascita,:telefono,:email,:actable_id,:actable_type,:password,:password_confirmation,:citta_id,:indirizzo,:sesso,:citta_nascita,:descrizione_indirizzo)
    end
end
