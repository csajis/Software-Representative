class SubAlertsController < ApplicationController
  before_action :set_sub_alert, only: [:show, :edit, :update, :destroy]

  # GET /sub_alerts
  # GET /sub_alerts.json
  def index
    @sub_alerts = SubAlert.all
  end

  # GET /sub_alerts/1
  # GET /sub_alerts/1.json
  def show
  end

  # GET /sub_alerts/new
  def new
    @sub_alert = SubAlert.new
  end

  # GET /sub_alerts/1/edit
  def edit
  end

  # POST /sub_alerts
  # POST /sub_alerts.json
  def create
    @sub_alert = SubAlert.new(sub_alert_params)

    respond_to do |format|
      if @sub_alert.save
        format.html { redirect_to @sub_alert, notice: 'Sub alert was successfully created.' }
        format.json { render :show, status: :created, location: @sub_alert }
      else
        format.html { render :new }
        format.json { render json: @sub_alert.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sub_alerts/1
  # PATCH/PUT /sub_alerts/1.json
  def update
    respond_to do |format|
      if @sub_alert.update(sub_alert_params)
        format.html { redirect_to @sub_alert, notice: 'Sub alert was successfully updated.' }
        format.json { render :show, status: :ok, location: @sub_alert }
      else
        format.html { render :edit }
        format.json { render json: @sub_alert.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sub_alerts/1
  # DELETE /sub_alerts/1.json
  def destroy
    @sub_alert.destroy
    respond_to do |format|
      format.html { redirect_to sub_alerts_url, notice: 'Sub alert was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sub_alert
      @sub_alert = SubAlert.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sub_alert_params
      params.require(:sub_alert).permit(:notification_id, :subscription_id)
    end
end
