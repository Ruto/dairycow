module V1
class CowShadesController < ApplicationController
  before_action :set_cow_shade, only: [:show, :update, :destroy, :deactivate]
  before_action :authenticate_user!

  # GET /cow_shades
  # GET /cow_shades.json
  def index
    @cow_shades = CowShade.all
  end

  # GET /cow_shades/1
  # GET /cow_shades/1.json
  def show
  end

  # POST /cow_shades
  # POST /cow_shades.json
  def create
    @cow_shade = CowShade.new(cow_shade_params)
    @cow_shade.created_by = @current_user.id

    if @cow_shade.save
      render :show, status: :created, location: v1_cow_shade_url(@cow_shade)
    else
      render json: @cow_shade.errors, status: :unprocessable_entity
    end
  end

  def deactivate
    @cow_shade.update(:active => false, :deactivated_by => @current_user.id)
    render :show, status: :ok, location: v1_cow_shade_url(@cow_shade)
  end

  # PATCH/PUT /cow_shades/1
  # PATCH/PUT /cow_shades/1.json
  def update
    if @cow_shade.update(cow_shade_params)
      render :show, status: :ok, location: v1_cow_shade_url(@cow_shade)
    else
      render json: @cow_shade.errors, status: :unprocessable_entity
    end
  end

  # DELETE /cow_shades/1
  # DELETE /cow_shades/1.json
  def destroy
    @cow_shade.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cow_shade
      @cow_shade = CowShade.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cow_shade_params
      params.permit(:cow_id, :shade_id, :active, :created_by, :deactivated_by)
    end
end
end
