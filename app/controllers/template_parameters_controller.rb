class TemplateParametersController < ApplicationController
  before_action :set_template_parameter, only: [:show, :edit, :update, :destroy]

  # GET /template_parameters
  # GET /template_parameters.json
  def index
      @template = Template.find(params[:template_id])
      @template_parameters = TemplateParameter.all
  end

  # GET /template_parameters/1
  # GET /template_parameters/1.json
  def show
      @template = Template.find(params[:template_id])
  end

  # GET /template_parameters/new
  def new
      @template = Template.find(params[:template_id])
    @template_parameter = TemplateParameter.new
  end

  # GET /template_parameters/1/edit
  def edit
      @template = Template.find(params[:template_id])
  end

  # POST /template_parameters
  # POST /template_parameters.json
  def create

    @template = Template.find(params[:template_id])
    @template_parameter = @template.template_parameters.create(template_parameter_params)
    redirect_to template_path(@template)
    #@template_parameter = TemplateParameter.new(template_parameter_params)
  end

  # PATCH/PUT /template_parameters/1
  # PATCH/PUT /template_parameters/1.json
  def update
    respond_to do |format|
      if @template_parameter.update(template_parameter_params)
        format.html { redirect_to @template_parameter, notice: 'Template parameter was successfully updated.' }
        format.json { render :show, status: :ok, location: @template_parameter }
      else
        format.html { render :edit }
        format.json { render json: @template_parameter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /template_parameters/1
  # DELETE /template_parameters/1.json
  def destroy
    @template_parameter.destroy
    respond_to do |format|
      format.html { redirect_to template_template_parameters_url, notice: 'Template parameter was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_template_parameter
      @template_parameter = TemplateParameter.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def template_parameter_params
      params.require(:template_parameter).permit(:name, :value, :atom_id, :param_type)
    end
end
