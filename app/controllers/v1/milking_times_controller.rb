module V1
class MilkingTimesController < ApplicationController
  before_action :set_milking_time, only: [:show, :update, :destroy, :deactivate]
  before_action :authenticate_user!

  # GET /milking_times
  # GET /milking_times.json
  def index
    @milking_times = MilkingTime.all
  end

  # GET /milking_times/1
  # GET /milking_times/1.json
  def show
  end

  # POST /milking_times
  # POST /milking_times.json
  def create
    @milking_time = MilkingTime.new(milking_time_params)
    #@milking_time.milking_timeable_type = timeable_type
    @milking_time.created_by = @current_user.id

    if @milking_time.save
      render :show, status: :created, location: v1_milking_time_url(@milking_time)
    else
      render json: @milking_time.errors, status: :unprocessable_entity
    end
  end

  def deactivate
    @milking_time.update(:active => false, :deactivated_by => @current_user.id)
    render :show, status: :ok, location: v1_milking_time_url(@milking_time)
  end


  # PATCH/PUT /milking_times/1
  # PATCH/PUT /milking_times/1.json
  def update
    if @milking_time.update(milking_time_params)
      render :show, status: :ok, location: v1_milking_time_url(@milking_time)
    else
      render json: @milking_time.errors, status: :unprocessable_entity
    end
  end

  # DELETE /milking_times/1
  # DELETE /milking_times/1.json
  def destroy
    @milking_time.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_milking_time
      @milking_time = MilkingTime.find(params[:id])
    end

    def timeable_type

    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def milking_time_params
      params.permit(:milking_timeable_id, :milking_timeable_type, :first_milking, :second_milking, :third_milking, :fourth_milking, :milking_count)
    end
end
end
