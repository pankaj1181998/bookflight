class IataCodesController < ApplicationController
  before_action :set_iata_code, only: [:show, :edit, :update, :destroy]

  # GET /iata_codes
  # GET /iata_codes.json
  def index
    @iata_codes = IataCode.all
  end

  # GET /iata_codes/1
  # GET /iata_codes/1.json
  def show
  end

  # GET /iata_codes/new
  def new
    @iata_code = IataCode.new
  end

  # GET /iata_codes/1/edit
  def edit
  end

  # POST /iata_codes
  # POST /iata_codes.json
  def create
    @iata_code = IataCode.new(iata_code_params)

    respond_to do |format|
      if @iata_code.save
        format.html { redirect_to @iata_code, notice: 'Iata code was successfully created.' }
        format.json { render :show, status: :created, location: @iata_code }
      else
        format.html { render :new }
        format.json { render json: @iata_code.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /iata_codes/1
  # PATCH/PUT /iata_codes/1.json
  def update
    respond_to do |format|
      if @iata_code.update(iata_code_params)
        format.html { redirect_to @iata_code, notice: 'Iata code was successfully updated.' }
        format.json { render :show, status: :ok, location: @iata_code }
      else
        format.html { render :edit }
        format.json { render json: @iata_code.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /iata_codes/1
  # DELETE /iata_codes/1.json
  def destroy
    @iata_code.destroy
    respond_to do |format|
      format.html { redirect_to iata_codes_url, notice: 'Iata code was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_iata_code
      @iata_code = IataCode.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def iata_code_params
      params.require(:iata_code).permit(:city, :airport, :code)
    end
end
