class CardInstancesController < ApplicationController
  before_action :set_card_instance, only: [:show, :edit, :update, :destroy]

  # GET /card_instances
  # GET /card_instances.json
  def index
    @card_instances = CardInstance.all
  end

  # GET /card_instances/1
  # GET /card_instances/1.json
  def show
  end

  # GET /card_instances/new
  def new
      @cards = Card.all
      session[:return_to] ||= request.referer # return to previous page after editing finished
    @card_instance = CardInstance.new
  end

  # GET /card_instances/1/edit
  def edit
      @cards = Card.all
  end

  # POST /card_instances
  # POST /card_instances.json
  def create
      parent = params[:parent_id]

      if !parent.blank?
          puts "there was a parent"
          puts parent

          puts CardInstance.all
          parentobject = CardInstance.find(parent)
          @card_instance = parentobject.append_child(card_instance_params)
      else
    @card_instance = CardInstance.new(card_instance_params)
    #@card_instance = CardInstance.append_sibling(card_instance_params)
      end


        respond_to do |format|
      #@article = Article.find(params[:card_instance][:article_id])
      if @card_instance.save
        #format.html { redirect_to [:edit, @article], notice: 'Card instance was successfully created.' }
        format.html { redirect_to session.delete(:return_to), notice: 'Card instance was successfully created.' }
        format.json { render :show, status: :created, location: @card_instance }
      else
        format.html { render :new }
        format.json { render json: @card_instance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /card_instances/1
  # PATCH/PUT /card_instances/1.json
  def update
    respond_to do |format|
      if @card_instance.update(card_instance_params)
        format.html { redirect_to @card_instance, notice: 'Card instance was successfully updated.' }
        format.json { render :show, status: :ok, location: @card_instance }
      else
        format.html { render :edit }
        format.json { render json: @card_instance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /card_instances/1
  # DELETE /card_instances/1.json
  def destroy
      session[:return_to] ||= request.referer # return to previous page after editing finished
      @card_instance.destroy
      respond_to do |format|
      #format.html { redirect_to card_instances_url, notice: 'Card instance was successfully destroyed.' }
        format.html { redirect_to session.delete(:return_to), notice: 'Card instance was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_card_instance
      @card_instance = CardInstance.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def card_instance_params
      params.require(:card_instance).permit(:card_id,:sort_order,:parent_id, :article_id)
    end
end
