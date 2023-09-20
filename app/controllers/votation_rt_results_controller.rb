class VotationRtResultsController < ApplicationController
  before_action :set_votation_rt_result, only: [:show, :edit, :update, :destroy]

  # GET /votation_rt_results
  # GET /votation_rt_results.json
  def index
    @votation_rt_results = VotationRtResult.all
  end

  # GET /votation_rt_results/1
  # GET /votation_rt_results/1.json
  def show
  end

  # GET /votation_rt_results/new
  def new
    @votation_rt_result = VotationRtResult.new
  end

  # GET /votation_rt_results/1/edit
  def edit
  end

  # POST /votation_rt_results
  # POST /votation_rt_results.json
  def create
    @votation_rt_result = VotationRtResult.new(votation_rt_result_params)

    respond_to do |format|
      if @votation_rt_result.save
        format.html { redirect_to @votation_rt_result, notice: 'Votation rt result was successfully created.' }
        format.json { render :show, status: :created, location: @votation_rt_result }
      else
        format.html { render :new }
        format.json { render json: @votation_rt_result.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /votation_rt_results/1
  # PATCH/PUT /votation_rt_results/1.json
  def update
    respond_to do |format|
      if @votation_rt_result.update(votation_rt_result_params)
        format.html { redirect_to @votation_rt_result, notice: 'Votation rt result was successfully updated.' }
        format.json { render :show, status: :ok, location: @votation_rt_result }
      else
        format.html { render :edit }
        format.json { render json: @votation_rt_result.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /votation_rt_results/1
  # DELETE /votation_rt_results/1.json
  def destroy
    @votation_rt_result.destroy
    respond_to do |format|
      format.html { redirect_to votation_rt_results_url, notice: 'Votation rt result was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_votation_rt_result
      @votation_rt_result = VotationRtResult.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def votation_rt_result_params
      params.require(:votation_rt_result).permit(:votation_id, :temporal_result)
    end
end
