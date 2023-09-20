# frozen_string_literal: true

# Controlador de Votantes
class VotersController < ApplicationController
  before_action :set_voter, only: [:show, :edit, :update, :destroy, :imgchange, :validate_form, :validate_doc]

  # GET /voters
  # GET /voters.json
  def index
    @voters = Voter.search(params[:search])
  end

  # GET /voters/1
  # GET /voters/1.json
  def show
  end

  # GET /voters/new
  def new
    @voter = Voter.new
  end

  # GET /voters/1/edit
  def edit; end

  # GET /voters/1/imgchange
  def imgchange
  end

  def validate_form
  end

  def validate_doc
    byebug
    status = @voter.validate_doc(
      IdentityDoc.doc_type_by_id(params[:doc_type].to_i).to_s.upcase,
      params[:run],
      params[:doc_number]
    )
    respond_to do |format|
      if status == :validated
        format.html { redirect_to @voter, notice: 'Voter was successfully validated.' }
        format.json { render :show, status: :created, location: @voter }
      else
        format.html { render :validate_form, notice: 'Error, no se pudo validar.' }
        format.json { render json: @voter.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /voters
  # POST /voters.json
  def create
    @voter = Voter.new(voter_params)

    respond_to do |format|
      if @voter.save
        format.html { redirect_to @voter, notice: 'Voter was successfully created.' }
        format.json { render :show, status: :created, location: @voter }
      else
        format.html { render :new }
        format.json { render json: @voter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /voters/1
  # PATCH/PUT /voters/1.json
  def update
    respond_to do |format|
      if @voter.update(voter_params)
        format.html { redirect_to @voter, notice: 'Perfil editado exitosamente.' }
        format.json { render :show, status: :ok, location: @voter }
      else
        format.html { render :edit }
        format.json { render json: @voter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /voters/1
  # DELETE /voters/1.json
  def destroy
    @voter.destroy
    respond_to do |format|
      format.html { redirect_to voters_url, notice: 'Voter was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_voter
    @voter = Voter.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def voter_params
    params.require(:voter).permit(:FirstName, :MiddleName, :LastName, :SecondLastName, :imgpath)
  end
end
