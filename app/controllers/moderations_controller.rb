# frozen_string_literal: true

# Controlador de Moderaciones
class ModerationsController < ApplicationController
  before_action :set_moderation, only: %i[show edit update destroy]

  # GET /moderations
  # GET /moderations.json
  def index
    @moderations = Moderation.all
  end

  # GET /moderations/1
  # GET /moderations/1.json
  def show; end

  # GET /moderations/new
  def new
    @moderation = Moderation.new
  end

  # GET /moderations/1/edit
  def edit; end

  # POST /moderations
  # POST /moderations.json
  def create
    @moderation = Moderation.new(moderation_params)

    respond_to do |format|
      if @moderation.save
        format.html { redirect_to @moderation, notice: 'Moderation was successfully created.' }
        format.json { render :show, status: :created, location: @moderation }
      else
        format.html { render :new }
        format.json { render json: @moderation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /moderations/1
  # PATCH/PUT /moderations/1.json
  def update
    respond_to do |format|
      if @moderation.update(moderation_params)
        format.html { redirect_to @moderation, notice: 'Moderation was successfully updated.' }
        format.json { render :show, status: :ok, location: @moderation }
      else
        format.html { render :edit }
        format.json { render json: @moderation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /moderations/1
  # DELETE /moderations/1.json
  def destroy
    @moderation.destroy
    respond_to do |format|
      format.html { redirect_to moderations_url, notice: 'Moderation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_moderation
    @moderation = Moderation.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def moderation_params
    params.require(:moderation).permit(:admin_id, :votation_id)
  end
end
