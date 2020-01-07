module V1
class MilkingSchedulesController < ApplicationController
  before_action :set_milking_schedule, only: [:show, :update, :destroy]

  # GET /milking_schedules
  # GET /milking_schedules.json
  def index
    @milking_schedules = MilkingSchedule.all
  end

  # GET /milking_schedules/1
  # GET /milking_schedules/1.json
  def show
  end

  # POST /milking_schedules
  # POST /milking_schedules.json
  def create
    @milking_schedule = MilkingSchedule.new(milking_schedule_params)

    if @milking_schedule.save
      render :show, status: :created, location: v1_milking_schedule_url(@milking_schedule)
    else
      render json: @milking_schedule.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /milking_schedules/1
  # PATCH/PUT /milking_schedules/1.json
  def update
    if @milking_schedule.update(milking_schedule_params)
      render :show, status: :ok, location: @milking_schedule
    else
      render json: @milking_schedule.errors, status: :unprocessable_entity
    end
  end

  # DELETE /milking_schedules/1
  # DELETE /milking_schedules/1.json
  def destroy
    @milking_schedule.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_milking_schedule
      @milking_schedule = MilkingSchedule.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def milking_schedule_params
      params.require(:milking_schedule).permit(:cow_id, :first_milking, :second_milking, :third_milking, :fourth_milking, :milking_count)
    end
end
end
