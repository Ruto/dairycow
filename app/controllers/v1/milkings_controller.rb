module V1
class MilkingsController < ApplicationController
  before_action :set_milking, only: [:show, :update, :destroy, :confirm_milking ]
  before_action :authenticate_user!
  # GET /milkings
  # GET /milkings.json
  def index
  #  if params[:dairy_id]
  #  @current_user.diary
    @milkings = Milking.all
    render :index, status: :created, location: v1_milking_url(@milkings)
  end

  # GET /milkings/1
  # GET /milkings/1.json
  def show
  end

  # POST /milkings
  # POST /milkings.json
  def create
    @milking = Milking.new(milking_params)
    @milking.user_id = @current_user.id
   # @milking.milking_time_id = milking_schedule_id
    @milking.milking_datetime = Time.now
    @milking.type = milking_period

   #if Time.now - milking.milking_datetime > 4.hours
    if @milking.save
      render :show, status: :created, location: v1_milking_url(@milking)
    else
      render json: @milking.errors, status: :unprocessable_entity
    end
  #else
    
  #end  
  end

  def confirm_milking
    @milking.update(confirmed_by: @current_user.id)
  end  
  # PATCH/PUT /milkings/1
  # PATCH/PUT /milkings/1.json
  def update
    if @milking.update(milking_params)
      render :show, status: :ok, location: v1_milking_url(@milking)
    else
      render json: @milking.errors, status: :unprocessable_entity
    end
  end

  # DELETE /milkings/1
  # DELETE /milkings/1.json
  def destroy
    @milking.destroy
    render json: {status: "Record Deleted"}
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_milking
      @milking = Milking.find(params[:id])
    end

    def milking_period
    milking  = Milking.where(cow_id: params[:cow_id], created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day)
        # if Time.now - milking.last.created_at > 4.hours #milking.milking_datetime 
        milking_count = milking.count
        case milking_count
        when 0
          return "Milkings::FirstMilking"
        when 1
          return "Milkings::SecondMilking"
        when 2
          return "Milkings::ThirdMilking"
        when 3
          return "Milkings::FourthMilking"
        when 4
          return "Milkings::FifthMilking"
        else
          "Error has occured"
        end
   

    end

    def milking_schedule_id
      cow = Cow.where(id: params[:cow_id], milkable: true, active: true)
      
      if cow.present? 
        milking_time = MilkingTime.where(milking_time_id: cow.id, milking_time_type: "Cow", active: true).last
        return milking_time.id
      end
      if cow.shades.present?  # Check for active status
        milking_time = MilkingTime.where(milking_time_id: cow.shades.last.id, milking_time_type: "Shade", active: true).last
        return milking_time.id
      end
      if cow.dairies.present?
        milking_time = MilkingTime.where(milking_time_id: cow.dairies.last.id, milking_time_type: "Dairy", active: true).last
        return milking_time.id
      end

    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def milking_params
      params.permit(:cow_id, :quantity, :milked_by)
    end
end
end
