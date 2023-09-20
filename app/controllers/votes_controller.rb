# frozen_string_literal: true

# Controlador de votos
class VotesController < ApplicationController
  before_action :set_vote, only: [:show, :edit, :update, :destroy]

  # GET /votes
  # GET /votes.json
  def index
    @votes = Vote.all
  end

  # GET /votes/1
  # GET /votes/1.json
  def show; end

  # GET /votes/new
  def new
    @vote = Vote.new
  end

  # GET /votes/1/edit
  def edit; end

  # POST /votes
  # POST /votes.json
  def create
    @vote = Vote.new(vote_params)
    @vote.voter = current_user
    respond_to do |format|
      if @vote.save
        format.html { redirect_to @vote.votation, notice: 'Tu voto fue creado exitosamente' }
        format.json { render :show, status: :created, location: @vote.votation }
      else
        format.html { redirect_to @vote.votation, alert: 'No fue posible guardar tu voto' }
        format.json { render json: @vote.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /votes/1
  # PATCH/PUT /votes/1.json
  def update
    respond_to do |format|
      if @vote.update(vote_params)
        format.html { redirect_to @vote.votation, notice: 'Tu voto fue cambiado exitosamente.' }
        format.json { render :show, status: :ok, location: @vote }
      else
        format.html { redirect_to @vote.votation, alert: 'No fue posible cambiar tu Voto' }
        format.json { render json: @vote.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /votes/1
  # DELETE /votes/1.json
  def destroy
    @vote.destroy
    respond_to do |format|
      format.html { redirect_to votes_url, notice: 'Vote was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_vote
    @vote = Vote.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def vote_params
    params.require(:vote).permit(:votation_id, :votation_option_id)
  end
end
