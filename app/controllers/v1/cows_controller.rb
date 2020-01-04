module V1
  class CowsController < ApplicationController
    before_action :set_cow, only: [:show, :update, :destroy]
    before_action :authenticate_user!

    # GET /cows
    # GET /cows.json
    def index
      @cows = Cow.all
    end

    # GET /cows/1
    # GET /cows/1.json
    def show
    end

    # POST /cows
    # POST /cows.json
    def create
      user_id = @current_user.id
      @cow = Cow.new(cow_params)
      @cow.created_by = user_id
      @cow.female = false if params[:female] == "false"
      @cow.dairy_id = get_dairy

      if @cow.save
        render :show, status: :created, location: v1_cow_url(@cow)
      else
        render json: @cow.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /cows/1
    # PATCH/PUT /cows/1.json
    def update
      if @cow.update(cow_params)
        render :show, status: :ok, location: @cow
      else
        render json: @cow.errors, status: :unprocessable_entity
      end
    end

    # DELETE /cows/1
    # DELETE /cows/1.json
    def destroy
      @cow.destroy
    end

    private
      # Use callbacks to share common setup or constraints between actions.

      def get_dairy
        if params[:dairy_id].present?
            params[:dairy_id]
        else
          if @current_user.dairies.count == 1
            return @current_user.dairies.first.id
          else
            return nil
          end
        end
      end
      def set_cow
        @cow = Cow.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def cow_params
        params.permit(:name, :dob, :breed, :female, :created_by, :dairy_id, :birth_by, :photo_id, :active, :deactivation_reason)
      end
  end
end
