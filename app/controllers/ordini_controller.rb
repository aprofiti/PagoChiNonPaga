class OrdiniController < ApplicationController
  before_action :set_ordine, only: [:show, :edit, :update, :destroy]

  # GET /ordini
  # GET /ordini.json
  def index
    @ordini = Ordine.all
  end

  # GET /ordini/1
  # GET /ordini/1.json
  def show
  end

  # GET /ordini/new
  def new
    @ordine = Ordine.new
  end

  # GET /ordini/1/edit
  def edit
  end

  # POST /ordini
  # POST /ordini.json
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
    # Use callbacks to share common setup or constraints between actions.
    def set_ordine
      @ordine = Ordine.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ordine_params
      params.require(:ordine).permit(:data, :stato)
    end
end
