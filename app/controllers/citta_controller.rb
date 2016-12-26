class CittaController < ApplicationController
  before_action :set_citta, only: [:show, :edit, :update, :destroy]
  before_filter :id_citta_match , only: :show
  # GET /citta
  # GET /citta.json
  def index
    @citta = Citta.all
  end

  # GET /citta/1
  # GET /citta/1.json
  def show
  end



  # POST /citta
  # POST /citta.json
  def create
    @citta = Citta.new(citta_params)

    respond_to do |format|
      if @citta.save
        format.html { redirect_to @citta, notice: 'Citta was successfully created.' }
        format.json { render :show, status: :created, location: @citta }
      else
        format.html { render :new }
        format.json { render json: @citta.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /citta/1
  # PATCH/PUT /citta/1.json
  def update
    respond_to do |format|
      if @citta.update(citta_params)
        format.html { redirect_to @citta, notice: 'Citta was successfully updated.' }
        format.json { render :show, status: :ok, location: @citta }
      else
        format.html { render :edit }
        format.json { render json: @citta.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /citta/1
  # DELETE /citta/1.json
  def destroy
    @citta.destroy
    respond_to do |format|
      format.html { redirect_to citta_index_url, notice: 'Citta was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def id_citta_match
      citta = Citta.find(params[:id].to_i)
      if citta.nome != params[:nome]
        redirect_to(citta_path(nome: citta.nome, id: citta.id))
      end
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_citta
      @citta = Citta.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def citta_params
      params.require(:citta).permit(:nome, :provincia, :regione)
    end
end
