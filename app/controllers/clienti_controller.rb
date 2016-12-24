class ClientiController < ApplicationController
  before_action :set_cliente, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_utente! , except: [:new,:create]
  before_filter :controllo_id_cliente, except: [:new, :create]


  # GET /clienti/1
  # GET /clienti/1.json
  def show
  end

  # GET /clienti/new
  def new
    if utente_signed_in?
      redirect_to :back
    end
    @cliente = Cliente.new
  end

  # GET /clienti/1/edit
  def edit
  end

  #POST -> Aggiunge al carrello il prodotto presente nella pagina in cui viene richamato
  def add_cart
    if current_utente.hasCarrello?
      carrello= current_utente.getCarrello
    else
      carrello= Carrello.create(cliente_id: current_utente.actable_id)
    end
    prod= Prodotto.find(params[:prodotto_id])
    qta = params[:prodotto][:qta].to_i
    if prod.checkDisponibilita(qta,prod,carrello)
      carrello.add(prod,prod.prezzo,qta)
      redirect_back
    else
      flash[:notice] = "Quantita selezionata non disponibile"
      redirect_to(:back)
    end
  end
  # POST /clienti
  # POST /clienti.json
  #Dopo la creazione PER ORA l'utente viene reindirizzato alla schermata di login
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

  # PATCH/PUT /clienti/1
  # PATCH/PUT /clienti/1.json
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

  # DELETE /clienti/1
  # DELETE /clienti/1.json
  def destroy
    @cliente.destroy
    respond_to do |format|
      format.html { redirect_to clienti_url, notice: 'Cliente was successfully destroyed.' }
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

    # Never trust parameters from the scary internet, only allow the white list through.
    def cliente_params
      #params.fetch(:cliente, {})
      params.require(:cliente).permit(:nome,:cognome,:cf,:data_nascita,:telefono,:email,:actable_id,:actable_type,:password,:password_confirmation)
    end
end
