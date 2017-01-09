class TitolariController < ApplicationController
  before_action :set_titolare, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_utente!, except: [:new,:create]
  before_filter :controllo_id_titolare, except:  [:new,:create]


  # GET /titolari/1
  # GET /titolari/1.json
  def show
  end

  # GET /titolari/new
  def new
    if utente_signed_in?
      redirect_to :back
    end
    @titolare = Titolare.new
  end

  # GET /titolari/1/edit
  def edit
  end

  # POST /titolari
  # POST /titolari.json
  def create
    @titolare = Titolare.new(titolare_params)

    respond_to do |format|
      if @titolare.save
        format.html { redirect_to @titolare, notice: 'Titolare was successfully created.' }
        format.json { render :show, status: :created, location: @titolare }
      else
        format.html { render :new }
        format.json { render json: @titolare.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /titolari/1
  # PATCH/PUT /titolari/1.json
  def update
    respond_to do |format|
      if @titolare.update(titolare_params)
        format.html { redirect_to @titolare, notice: 'Titolare was successfully updated.' }
        format.json { render :show, status: :ok, location: @titolare }
      else
        format.html { render :edit }
        format.json { render json: @titolare.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /titolari/1
  # DELETE /titolari/1.json
  def destroy
    @titolare.destroy
    respond_to do |format|
      format.html { redirect_to titolari_url, notice: 'Titolare was successfully destroyed.' }
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

    # Never trust parameters from the scary internet, only allow the white list through.
    def titolare_params
      params.require(:titolare).permit(:nome,:cognome,:cf,:data_nascita,:telefono,:email,:piva,:actable_id,:actable_type,:password,:password_confirmation,:indirizzo,:citta_id)
    end
end
