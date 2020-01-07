module V1
class CowDairiesController < ApplicationController
  before_action :set_cow_dairy, only: [:show, :update, :destroy]
  before_action :authenticate_user!

  # GET /cow_dairies
  # GET /cow_dairies.json
  def index
    @cow_dairies = CowDairy.all
  end

  # GET /cow_dairies/1
  # GET /cow_dairies/1.json
  def show
  end

  # POST /cow_dairies
  # POST /cow_dairies.json
  def create
    @cow_dairy = CowDairy.new(cow_dairy_params)
    @cow_dairy.user_id = @current_user.id

    if @cow_dairy.save
      render :show, status: :created, location: v1_cow_dairy_url(@cow_dairy)
    else
      render json: @cow_dairy.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /cow_dairies/1
  # PATCH/PUT /cow_dairies/1.json
  def update
    if @cow_dairy.update(cow_dairy_params)
      render :show, status: :ok, location: v1_cow_dairy_url(@cow_dairy)
    else
      render json: @cow_dairy.errors, status: :unprocessable_entity
    end
  end

  # DELETE /cow_dairies/1
  # DELETE /cow_dairies/1.json
  def destroy
    @cow_dairy.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cow_dairy
      @cow_dairy = CowDairy.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cow_dairy_params
      params.permit(:cow_id, :dairy_id, :user_id, :active, :transfer_key)
    end
end
end
