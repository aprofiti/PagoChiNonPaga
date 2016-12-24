class PoliController < ApplicationController
  before_action :set_polo, only: [:show, :edit, :update, :destroy]

  # GET /poli
  # GET /poli.json
  def index
    @poli = Polo.all
  end

  # GET /poli/1
  # GET /poli/1.json
  def show
  end

  # POST /poli
  # POST /poli.json
  def create
    @polo = Polo.new(polo_params)

    respond_to do |format|
      if @polo.save
        format.html { redirect_to @polo, notice: 'Polo was successfully created.' }
        format.json { render :show, status: :created, location: @polo }
      else
        format.html { render :new }
        format.json { render json: @polo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /poli/1
  # PATCH/PUT /poli/1.json
  def update
    respond_to do |format|
      if @polo.update(polo_params)
        format.html { redirect_to @polo, notice: 'Polo was successfully updated.' }
        format.json { render :show, status: :ok, location: @polo }
      else
        format.html { render :edit }
        format.json { render json: @polo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /poli/1
  # DELETE /poli/1.json
  def destroy
    @polo.destroy
    respond_to do |format|
      format.html { redirect_to poli_url, notice: 'Polo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_polo
      @polo = Polo.find_by(nome: params[:nome])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def polo_params
      params.require(:polo).permit(:nome)
    end
end
