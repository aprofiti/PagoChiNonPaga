class CarrelloController < ApplicationController
  before_action :set_carrello, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_utente!
  before_filter :is_my_carrello?
  # GET /carrello
  # GET /carrello.json
  def index
    @carrello = Carrello.all
  end

  # GET /carrello/1
  # GET /carrello/1.json
  def show
  end

  # GET /carrello/new
  def new
    @carrello = Carrello.new
  end

  # GET /carrello/1/edit
  def edit
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

  # PATCH/PUT /carrello/1
  # PATCH/PUT /carrello/1.json
  def update
    respond_to do |format|
      if @carrello.update(carrello_params)
        format.html { redirect_to @carrello, notice: 'Carrello was successfully updated.' }
        format.json { render :show, status: :ok, location: @carrello }
      else
        format.html { render :edit }
        format.json { render json: @carrello.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /carrello/1
  # DELETE /carrello/1.json
  def destroy
    @carrello.destroy
    respond_to do |format|
      format.html { redirect_to carrello_index_url, notice: 'Carrello was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def is_my_carrello?
        if !(current_utente.isCliente? && @carrello.cliente_id == current_utente.actable_id)
          redirect_back
        end
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_carrello
      @carrello = Carrello.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def carrello_params
      params.fetch(:carrello, {})
    end
end
