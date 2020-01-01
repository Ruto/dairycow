module V1
class DairiesController < ApplicationController
  before_action :set_dairy, only: [:show, :update, :destroy]
  before_action :authenticate_user!

  # GET /dairies
  # GET /dairies.json
  def index
    @dairies = Dairy.all
  end

  # GET /dairies/1
  # GET /dairies/1.json
  def show
  end

  # POST /dairies
  # POST /dairies.json
  def create
    @dairy = Dairy.new(dairy_params)
    @dairy.user_id = @current_user.id

    if @dairy.save
      render :show, status: :created, location: v1_dairy_url(@dairy)
    else
      render json: @dairy.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /dairies/1
  # PATCH/PUT /dairies/1.json
  def update
    if @dairy.update(dairy_params)
      render :show, status: :ok, location: @dairy
    else
      render json: @dairy.errors, status: :unprocessable_entity
    end
  end

  # DELETE /dairies/1
  # DELETE /dairies/1.json
  def destroy
    @dairy.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dairy
      @dairy = Dairy.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dairy_params
      params.permit(:name, :desc, :user_id, :active, :country, :county, :geolocation_id)
    end
end
end
