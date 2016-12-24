class IndirizziController < ApplicationController
  before_action :set_indirizzo, only: [:show, :edit, :update, :destroy]

  # POST /indirizzi
  # POST /indirizzi.json
  def create
    @indirizzo = Indirizzo.new(indirizzo_params)

    respond_to do |format|
      if @indirizzo.save
        format.html { redirect_to @indirizzo, notice: 'Indirizzo was successfully created.' }
        format.json { render :show, status: :created, location: @indirizzo }
      else
        format.html { render :new }
        format.json { render json: @indirizzo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /indirizzi/1
  # PATCH/PUT /indirizzi/1.json
  def update
    respond_to do |format|
      if @indirizzo.update(indirizzo_params)
        format.html { redirect_to @indirizzo, notice: 'Indirizzo was successfully updated.' }
        format.json { render :show, status: :ok, location: @indirizzo }
      else
        format.html { render :edit }
        format.json { render json: @indirizzo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /indirizzi/1
  # DELETE /indirizzi/1.json
  def destroy
    @indirizzo.destroy
    respond_to do |format|
      format.html { redirect_to indirizzi_url, notice: 'Indirizzo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_indirizzo
      @indirizzo = Indirizzo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def indirizzo_params
      params.require(:indirizzo).permit(:via, :ncivico, :cap, :quartiere)
    end
end
