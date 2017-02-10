class CarrelloController < ApplicationController
  before_action :set_carrello, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_utente!
  before_filter :is_my_carrello?


  # GET /carrello/:id
  # GET /carrello/:id.json
  def show
  end

  # POST /carrello/:id/remove_item
  def remove_item #rimuove item da carrello
    carrello = current_utente.getCarrello
    carrello.cart_items.delete(params[:item].to_i)  #item è un parametro che arriva dalla post
    redirect_to carrello_path(id: carrello.id)
  end

  # POST /carrello/:id/add_cart
  # Aggiunge al carrello il prodotto presente nella pagina in cui viene richamato
  def add_cart
    if current_utente.hasCarrello?
      carrello= current_utente.getCarrello
    else
      carrello= Carrello.create(cliente_id: current_utente.actable_id)
    end
    prodotto= Prodotto.find(params[:prodotto_id])
    qta_post = params[:prodotto][:qta].to_i
    if prodotto.checkDisponibilita(qta_post,carrello)
      carrello.add(prodotto,prodotto.prezzo,qta_post)
      redirect_back
    else
      flash[:notice] = "Quantita selezionata non disponibile"
      redirect_to(:back)
    end
  end

  # POST /carrello
  # POST /carrello.json
  def create
    @carrello = Carrello.new(carrello_params)

    respond_to do |format|
      if @carrello.save
        format.html { redirect_to @carrello, notice: 'Carrello was successfully created.' }
        format.json { render :show, status: :created, location: @carrello }
      else
        format.html { render :new }
        format.json { render json: @carrello.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /carrello/:id
  # DELETE /carrello/:id.json
  def destroy
    @carrello.destroy
    respond_to do |format|
      format.html { redirect_to carrello_index_url, notice: 'Carrello was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def is_my_carrello?
      if @carrello != nil
        if !(current_utente.isCliente? && @carrello.cliente_id == current_utente.actable_id)
          redirect_back
        end
      end
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_carrello
      @carrello = Carrello.find(params[:id])
    end

    def carrello_params
      params.fetch(:carrello, {})
    end
end
