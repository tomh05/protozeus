class AtomTypesController < ApplicationController
  before_action :set_atom_type, only: [:show, :edit, :update, :destroy]

  # GET /atom_types
  # GET /atom_types.json
  def index
    @atom_types = AtomType.all
  end

  # GET /atom_types/1
  # GET /atom_types/1.json
  def show
  end

  # GET /atom_types/new
  def new
    @atom_type = AtomType.new
  end

  # GET /atom_types/1/edit
  def edit
  end

  # POST /atom_types
  # POST /atom_types.json
  def create
    @atom_type = AtomType.new(atom_type_params)

    respond_to do |format|
      if @atom_type.save
        format.html { redirect_to @atom_type, notice: 'Atom type was successfully created.' }
        format.json { render :show, status: :created, location: @atom_type }
      else
        format.html { render :new }
        format.json { render json: @atom_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /atom_types/1
  # PATCH/PUT /atom_types/1.json
  def update
    respond_to do |format|
      if @atom_type.update(atom_type_params)
        format.html { redirect_to @atom_type, notice: 'Atom type was successfully updated.' }
        format.json { render :show, status: :ok, location: @atom_type }
      else
        format.html { render :edit }
        format.json { render json: @atom_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /atom_types/1
  # DELETE /atom_types/1.json
  def destroy
    @atom_type.destroy
    respond_to do |format|
      format.html { redirect_to atom_types_url, notice: 'Atom type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_atom_type
      @atom_type = AtomType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def atom_type_params
      params.require(:atom_type).permit(:name)
    end
end
