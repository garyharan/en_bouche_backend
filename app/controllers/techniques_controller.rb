class TechniquesController < ApplicationController
  before_action :set_technique, only: %i[ show edit update destroy ]

  # GET /techniques or /techniques.json
  def index
    @techniques = Technique.all
  end

  # GET /techniques/1 or /techniques/1.json
  def show
  end

  # GET /techniques/new
  def new
    @technique = Technique.new
  end

  # GET /techniques/1/edit
  def edit
  end

  # POST /techniques or /techniques.json
  def create
    @technique = Technique.new(technique_params)

    respond_to do |format|
      if @technique.save
        format.html { redirect_to technique_url(@technique), notice: "Technique was successfully created." }
        format.json { render :show, status: :created, location: @technique }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @technique.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /techniques/1 or /techniques/1.json
  def update
    respond_to do |format|
      if @technique.update(technique_params)
        format.html { redirect_to technique_url(@technique), notice: "Technique was successfully updated." }
        format.json { render :show, status: :ok, location: @technique }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @technique.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /techniques/1 or /techniques/1.json
  def destroy
    @technique.destroy!

    respond_to do |format|
      format.html { redirect_to techniques_url, notice: "Technique was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_technique
      @technique = Technique.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def technique_params
      params.require(:technique).permit(:name, :description)
    end
end
