class OrdiniController < ApplicationController
  before_action :set_ordine, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_utente!
  before_filter :is_mio_ordine?, only: [:show,:edit,:destroy]
  # GET /ordini
  # GET /ordini.json
  def index
    if current_utente.isCliente?
      @ordini = Cliente.find(current_utente.actable_id).ordini
    elsif current_utente.isTitolare?
      @ordini=[]
      titolare= Titolare.find(current_utente.actable_id)
      titolare.imprese.each do |impresa|
        @ordini+= impresa.ordini
      end
      @ordini
    end
  end

  # GET /ordini/1
  # GET /ordini/1.json
  def show

  end



  # GET /ordini/1/edit
  def edit
  end

  def prepara_ordini
    successo= true
    carrello= current_utente.getCarrello
    imprese = carrello.impreseCarrello
    impresa_prodotti= carrello.impresaElemento
    imprese.each do |impresa|
      prodotti= setOrdine(impresa_prodotti,impresa)
      if prodotti == nil
        successo= false
      else
      Ordine.create(cliente_id: current_utente.actable_id, stato_ordine_id: 1,impresa_id: impresa ,prodotti: prodotti)
    end
    end
    if successo
      carrello.destroy
      redirect_to root_path
    else
      flash[:notice] = "Errore con la disponibilità dei prodotti"
      redirect_to carrello_path(id: carrello.id)
    end
  end


  def create
    @ordine = Ordine.new(ordine_params)

    respond_to do |format|
      if @ordine.save
        format.html { redirect_to @ordine, notice: 'Ordine was successfully created.' }
        format.json { render :show, status: :created, location: @ordine }
      else
        format.html { render :new }
        format.json { render json: @ordine.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ordini/1
  # PATCH/PUT /ordini/1.json
  def update
    respond_to do |format|
      if @ordine.update(ordine_params)
        format.html { redirect_to @ordine, notice: 'Ordine was successfully updated.' }
        format.json { render :show, status: :ok, location: @ordine }
      else
        format.html { render :edit }
        format.json { render json: @ordine.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ordini/1
  # DELETE /ordini/1.json
  def destroy
    @ordine.destroy
    respond_to do |format|
      format.html { redirect_to ordini_url, notice: 'Ordine was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

#prende in ingresso il carrello e l'id di una impresa, cerca tutti i prodotti del carrello che appartengono a quella impresa
#e li mette in un array di prodotti, ripetendo eventualmente "quantita-volte" l'aggiunta di ogni oggetto
  def setOrdine(impresa_prodotti,impresa)
    prodotti= []
    impresa_prodotti.each do |elemento|
      if elemento.at(0) == impresa
        prodotto= Prodotto.find(elemento.at(1).item_id)
        qta= elemento.at(1).quantity.to_i
        if prodotto.checkDisponibilitaOrdine(qta)
          for i in 1..qta
            prodotti.push(prodotto)
          end
          prodotto.setQuantita(qta)    #COMMENTATO PER TEST NOSTRI. FUNZIONA E VA ABILITATO ALLA FINE. SCALA QUANTITÀ DA DB
        else
          return nil
        end
      end
    end
    prodotti
  end

  def is_mio_ordine?
    if(current_utente.isCliente? && @ordine.cliente_id == current_utente.actable_id)
    elsif (current_utente.isTitolare? && current_utente.isMyImpresa?(Impresa.find(@ordine.impresa_id)))
    else redirect_back
    end
  end
    # Use callbacks to share common setup or constraints between actions.
    def set_ordine
      @ordine = Ordine.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ordine_params
      params.require(:ordine).permit(:data, :cliente_id, :impresa_id, :stato_ordine_id)
    end
end
