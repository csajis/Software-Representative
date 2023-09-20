class VotationOptionsController < ApplicationController
  before_action :set_votation_option, only: [:show, :edit, :update, :destroy]

  # GET /votation_options
  # GET /votation_options.json
  def index
    @votation_options = VotationOption.all
  end

  # GET /votation_options/1
  # GET /votation_options/1.json
  def show
  end

  # GET /votation_options/new
  def new
    @votation_option = VotationOption.new
  end

  # GET /votation_options/1/edit
  def edit
  end

  # POST /votation_options
  # POST /votation_options.json
  def create
    @votation_option = VotationOption.new(votation_option_params)
    respond_to do |format|
      if @votation_option.save
        format.html { redirect_to edit_votation_path(@votation_option.votation), notice: 'Votation option was successfully created.' }
        format.json { render :edit, status: :created, location: @votation_option }
      else
        format.html { render :edit }
        format.json { render json: @votation_option.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /votation_options/1
  # PATCH/PUT /votation_options/1.json
  def update
    respond_to do |format|
      if @votation_option.update(votation_option_params)
        format.html { redirect_to @votation_option, notice: 'Votation option was successfully updated.' }
        format.json { render :show, status: :ok, location: @votation_option }
      else
        format.html { render :edit }
        format.json { render json: @votation_option.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /votation_options/1
  # DELETE /votation_options/1.json
  def destroy
    votation = @votation_option.votation
    @votation_option.destroy
    respond_to do |format|
      format.html { redirect_to edit_votation_path(votation) , notice: 'La opción fue eliminada exitosamente' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_votation_option
      @votation_option = VotationOption.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def votation_option_params
      params.require(:votation_option).permit(:name, :description, :votation_id)
    end
end
