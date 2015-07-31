class AtomsController < ApplicationController
  before_action :set_atom, only: [:show, :edit, :update, :destroy]

  # GET /atoms
  # GET /atoms.json
  def index
    @atoms = Atom.all
  end

  # GET /atoms/1
  # GET /atoms/1.json
  def show
  end

  # GET /atoms/new
  def new
    @atom = Atom.new
    @atom_types = AtomType.all
  end

  # GET /atoms/1/edit
  def edit
      @atom_types = AtomType.all
  end

  # POST /atoms
  # POST /atoms.json
  def create
    @atom = Atom.new(atom_params)

    respond_to do |format|
      if @atom.save
        format.html { redirect_to @atom, notice: 'Atom was successfully created.' }
        format.json { render :show, status: :created, location: @atom }
      else
        format.html { render :new }
        format.json { render json: @atom.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /atoms/1
  # PATCH/PUT /atoms/1.json
  def update
    respond_to do |format|
      if @atom.update(atom_params)
        format.html { redirect_to @atom, notice: 'Atom was successfully updated.' }
        format.json { render :show, status: :ok, location: @atom }
      else
        format.html { render :edit }
        format.json { render json: @atom.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /atoms/1
  # DELETE /atoms/1.json
  def destroy
    @atom.destroy
    respond_to do |format|
      format.html { redirect_to atoms_url, notice: 'Atom was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_atom
      @atom = Atom.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def atom_params
      params.require(:atom).permit(:title, :atom_type_id, :content, :url)
    end
end
