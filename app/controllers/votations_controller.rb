class VotationsController < ApplicationController
  before_action :set_votation, only: [:show, :edit, :update, :destroy, :start, :end, :moderate, :hide, :publish, :public_show]

  # GET /votations
  # GET /votations.json
  def index
    @votations = Votation.search(params[:search])
  end

  def index_public
    @votations = Votation.search(params[:search])
  end

  def public_show
  end

  def myvotations
    @votations = Votation.own_votations(current_user).search(params[:search])
  end

  # GET /votations/1
  # GET /votations/1.json
  def show
  end

  # GET /votations/new
  def new
    @votation = Votation.new
  end

  # GET /votations/1/edit
  def edit
  end


  def start
    @votation.imgpath = "/images/votationcreated.png"
    @votation.start!
  end

  # POST /votations
  # POST /votations.json
  def create
    @votation = Votation.new(votation_params)
    @votation.owner = current_user

    respond_to do |format|
      if @votation.save
        @votation.imgpath = "/images/votationcreated.png"
        @votation.create!
        format.html { redirect_to @votation, notice: 'La Votación fue creada exitosamente!' }
        format.json { render :show, status: :created, location: @votation }
      else
        format.html { render :new }
        format.json { render json: @votation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /votations/1
  # PATCH/PUT /votations/1.json
  def update
    @votation.attributes = votation_params
    if @votation.comments.any?
      unless @votation.comments.last.persisted?
        @votation.comments.last.voter = current_user
      end
    end

    respond_to do |format|
      if @votation.save
        format.html { redirect_to @votation, notice: 'Votation was successfully updated.' }
        format.json { render :show, status: :ok, location: @votation }
      else
        format.html { render :edit }
        format.json { render json: @votation.errors, status: :unprocessable_entity }
      end
    end
  end

  def hide
    respond_to do |format|
      if @votation.may_create?
        @votation.create!
        format.html { redirect_to edit_votation_path(@votation), notice: 'La votación fue ocultada con exito.' }
        format.json { render :show, status: :ok, location: @votation }
      else
        format.html { render :edit }
        format.json { render json: @votation.errors, status: :unprocessable_entity }
      end
    end
  end

  def publish
    respond_to do |format|
      if @votation.may_publish?
        @votation.publish!
        format.html { redirect_to edit_votation_path(@votation), notice: 'La votación fue publicada con exito.' }
        format.json { render :show, status: :ok, location: @votation }
      else
        format.html { render :edit }
        format.json { render json: @votation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /votations/1/start
    
  def start
    respond_to do |format|
      if @votation.may_start? and @votation.options.size > 1
        @votation.imgpath = "/images/votationstarted.png"
        @votation.start!
        format.html { redirect_to edit_votation_path(@votation), notice: 'La votación a comenzado.' }
        format.json { render :show, status: :ok, location: @votation }
      else
        format.html { render :edit }
        format.json { render json: @votation.errors, status: :unprocessable_entity }
      end
    end
  end

  def end
    respond_to do |format|
      if @votation.may_end?
        @votation.imgpath = "/images/votationended.png"
        @votation.end!
        format.html { redirect_to @votation, notice: 'La votación a finalizado.' }
        format.json { render :show, status: :ok, location: @votation }
      else
        format.html { render :edit }
        format.json { render json: @votation.errors, status: :unprocessable_entity }
      end
    end
  end

  def moderate
    if @votation.may_moderate?
      @votation.imgpath = "/images/votationmoderated.png"
      @votation.moderate!
    end
  end

  # DELETE /votations/1
  # DELETE /votations/1.json
  def destroy
    respond_to do |format|
      if @votation.may_delete?
        @votation.imgpath = "/images/votationdeleted.png"
        @votation.delete!
        @votation.archive
        format.html { redirect_to votations_url, notice: 'La votación fue borrada con exito' }
        format.json { head :no_content }
      else
        format.html { render :index }
        format.json { render json: @votation.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_votation
      @votation = Votation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def votation_params
      params.require(:votation).permit(:name, :description, :enabled, comments_attributes: {}, options_attributes: {})
    end

    
end
