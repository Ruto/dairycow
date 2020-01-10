module V1
class ShadesController < ApplicationController
  before_action :set_shade, only: [:show, :update, :destroy]
  before_action :authenticate_user!

  # GET /shades
  # GET /shades.json
  def index
    @shades = Shade.all
  end

  # GET /shades/1
  # GET /shades/1.json
  def show
  end

  # POST /shades
  # POST /shades.json
  def create
    @shade = Shade.new(shade_params)
    @shade.created_by = @current_user.id

    if @shade.save
      render :show, status: :created, location: v1_shade_url(@shade)
    else
      render json: @shade.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /shades/1
  # PATCH/PUT /shades/1.json
  def update
    if @shade.update(shade_params)
      render :show, status: :ok, location: v1_shade_url(@shade)
    else
      render json: @shade.errors, status: :unprocessable_entity
    end
  end

  # DELETE /shades/1
  # DELETE /shades/1.json
  def destroy
    @shade.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shade
      @shade = Shade.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shade_params
      params.permit(:dairy_id, :name, :desc, :capacity, :active, :created_by)
    end
end
end
