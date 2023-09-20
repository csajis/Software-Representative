class VotationResultsController < ApplicationController
  before_action :set_votation_result, only: [:show, :edit, :update, :destroy]

  # GET /votation_results
  # GET /votation_results.json
  def index
    @votation_results = VotationResult.all
  end

  # GET /votation_results/1
  # GET /votation_results/1.json
  def show
  end

  # GET /votation_results/new
  def new
    @votation_result = VotationResult.new
  end

  # GET /votation_results/1/edit
  def edit
  end

  # POST /votation_results
  # POST /votation_results.json
  def create
    @votation_result = VotationResult.new(votation_result_params)

    respond_to do |format|
      if @votation_result.save
        format.html { redirect_to @votation_result, notice: 'Votation result was successfully created.' }
        format.json { render :show, status: :created, location: @votation_result }
      else
        format.html { render :new }
        format.json { render json: @votation_result.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /votation_results/1
  # PATCH/PUT /votation_results/1.json
  def update
    respond_to do |format|
      if @votation_result.update(votation_result_params)
        format.html { redirect_to @votation_result, notice: 'Votation result was successfully updated.' }
        format.json { render :show, status: :ok, location: @votation_result }
      else
        format.html { render :edit }
        format.json { render json: @votation_result.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /votation_results/1
  # DELETE /votation_results/1.json
  def destroy
    @votation_result.destroy
    respond_to do |format|
      format.html { redirect_to votation_results_url, notice: 'Votation result was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_votation_result
      @votation_result = VotationResult.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def votation_result_params
      params.require(:votation_result).permit(:votation_id, :final_result)
    end
end
