class CardsController < ApplicationController
  before_action :set_card, only: [:show, :edit, :update, :destroy]

  # GET /cards
  # GET /cards.json
  def index
    @cards = Card.all
    @templates  = Template.all
  end

  # GET /cards/1
  # GET /cards/1.json
  def show
    @templates  = Template.all
    @card_parameters = CardParameter.where(card_id: params[:id])
  end

  # GET /cards/new
  def new
      @templates = Template.all
    @card = Card.new
  end

  # GET /cards/1/edit
  def edit
      @templates = Template.all
    @card_parameters = CardParameter.where(card_id: params[:id])
  end

  # POST /cards
  # POST /cards.json
  def create
    @card = Card.new(card_params)
    # Use template to create new card parameters
    template_parameters = Template.find(card_params[:template_id]).template_parameters
    template_parameters.each do |template_parameter|
        puts "para"
        puts template_parameter.id
        #<td><%= template_parameter.id %></td>
        #<td><%= template_parameter.template_id %></td>
        #<td><%= template_parameter.name %></td>
        #<td><%= template_parameter.param_type %></td>

        # TODO: make parameters
        new_card_params = [ name: template_parameter.name]
        @card_param = @card.card_parameters.new(new_card_params)
    end
    #@card = Card.card_parameters.new(card_params)

    respond_to do |format|
      if @card.save
        format.html { redirect_to @card, notice: 'Card was successfully created.' }
        format.json { render :show, status: :created, location: @card }
      else
        format.html { render :new }
        format.json { render json: @card.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cards/1
  # PATCH/PUT /cards/1.json
  def update
    respond_to do |format|
      if @card.update(card_params)
          #params[:card_parameters].each do |card_parameter|
          #    puts @card
          #    puts @card.card_parameters.each.update(card_parameter
          #    @card.card_parameters.find_by_id(card_parameter).update(card_parameter)
          #    puts  card_parameter
          #end
          @card.card_parameters.each do |card_parameter|
              puts "my param is"
              # Find the corresponding form entry
              new_value =  params[:card_parameters][card_parameter.id.to_s]["value"]
              card_parameter.update(value: new_value)
              #update(card_parameter
              end
              
        format.html { redirect_to @card, notice: 'Card was successfully updated.' }
        format.json { render :show, status: :ok, location: @card }
      else
        format.html { render :edit }
        format.json { render json: @card.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cards/1
  # DELETE /cards/1.json
  def destroy
    @card.card_parameters.destroy_all
    @card.destroy
    respond_to do |format|
      format.html { redirect_to cards_url, notice: 'Card was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_card
      @card = Card.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def card_params
      params.require(:card).permit(:name,:template_id)
    end
end
