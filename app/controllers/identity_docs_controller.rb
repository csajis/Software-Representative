class IdentityDocsController < ApplicationController
  before_action :set_identity_doc, only: [:show, :edit, :update, :destroy]

  # GET /identity_docs
  # GET /identity_docs.json
  def index
    @identity_docs = IdentityDoc.all
  end

  # GET /identity_docs/1
  # GET /identity_docs/1.json
  def show
  end

  # GET /identity_docs/new
  def new
    @identity_doc = IdentityDoc.new
  end

  # GET /identity_docs/1/edit
  def edit
  end

  # POST /identity_docs
  # POST /identity_docs.json
  def create
    @identity_doc = IdentityDoc.new(identity_doc_params)

    respond_to do |format|
      if @identity_doc.save
        format.html { redirect_to @identity_doc, notice: 'Identity doc was successfully created.' }
        format.json { render :show, status: :created, location: @identity_doc }
      else
        format.html { render :new }
        format.json { render json: @identity_doc.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /identity_docs/1
  # PATCH/PUT /identity_docs/1.json
  def update
    respond_to do |format|
      if @identity_doc.update(identity_doc_params)
        format.html { redirect_to @identity_doc, notice: 'Identity doc was successfully updated.' }
        format.json { render :show, status: :ok, location: @identity_doc }
      else
        format.html { render :edit }
        format.json { render json: @identity_doc.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /identity_docs/1
  # DELETE /identity_docs/1.json
  def destroy
    @identity_doc.destroy
    respond_to do |format|
      format.html { redirect_to identity_docs_url, notice: 'Identity doc was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_identity_doc
      @identity_doc = IdentityDoc.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def identity_doc_params
      params.require(:identity_doc).permit(:run, :doc_type, :doc_number)
    end
end
