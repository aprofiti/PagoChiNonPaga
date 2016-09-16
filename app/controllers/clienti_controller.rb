class ClientiController < ApplicationController
  before_action :set_cliente, only: [:show, :edit, :update, :destroy]

  # GET /clienti
  # GET /clienti.json
  def index
    @clienti = Cliente.all
  end

  # GET /clienti/1
  # GET /clienti/1.json
  def show
  end

  # GET /clienti/new
  def new
    @cliente = Cliente.new
  end

  # GET /clienti/1/edit
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
    # Use callbacks to share common setup or constraints between actions.
    def set_cliente
      @cliente = Cliente.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cliente_params
      #params.fetch(:cliente, {})
      params.require(:cliente).permit(nome,:cognome,:cf,:data_nascita,:telefono,:email,:actable_id,:actable_type))
    end
end
