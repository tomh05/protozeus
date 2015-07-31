class CardParametersController < ApplicationController
  before_action :set_card_parameter, only: [:show, :edit, :update, :destroy]

  # GET /card_parameters
  # GET /card_parameters.json
  def index
    @card_parameters = CardParameter.all
  end

  # GET /card_parameters/1
  # GET /card_parameters/1.json
  def show
    @card = Card.find(params[:card_id])
  end

  # GET /card_parameters/new
  def new
    @card = Card.find(params[:card_id])
    @card_parameter = CardParameter.new
  end

  # GET /card_parameters/1/edit
  def edit
  end

  # POST /card_parameters
  # POST /card_parameters.json
  def create
    @card = Card.find(params[:card_id])
    @card_parameter = @card.card_parameters.create(card_parameter_params)

    redirect_to card_path(@card)
  end

  # PATCH/PUT /card_parameters/1
  # PATCH/PUT /card_parameters/1.json
  def update
    respond_to do |format|
      if @card_parameter.update(card_parameter_params)
        format.html { redirect_to @card_parameter, notice: 'Card parameter was successfully updated.' }
        format.json { render :show, status: :ok, location: @card_parameter }
      else
        format.html { render :edit }
        format.json { render json: @card_parameter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /card_parameters/1
  # DELETE /card_parameters/1.json
  def destroy
    @card_parameter.destroy
    respond_to do |format|
      format.html { redirect_to card_parameters_url, notice: 'Card parameter was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_card_parameter
      @card_parameter = CardParameter.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def card_parameter_params
      params.require(:card_parameter).permit(:name, :value, :card_id)
    end
end
