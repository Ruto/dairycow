module V1
class RolesController < ApplicationController
  before_action :set_role, only: [:show, :update, :destroy]
  before_action :authenticate_request!, only: [:index, :create, :update, :destroy, :show]

  # GET /roles
  # GET /roles.json
  def index
    @roles = Role.all
  end

  # GET /roles/1
  # GET /roles/1.json
  def show
  end

  # POST /roles
  # POST /roles.json
  def create
    @role = Role.new(role_params)
    @role.created_by = @current_user.id

    if @role.save
      render :create, status: :created, locals: { role: @role  }
      #render :show, status: :created, location: @role
    else
      render json: @role.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /roles/1
  # PATCH/PUT /roles/1.json
  def update
    if @role.update(role_params)
      render :show, status: :ok, location: @role
    else
      render json: @role.errors, status: :unprocessable_entity
    end
  end

  # DELETE /roles/1
  # DELETE /roles/1.json
  def destroy
    @role.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_role
      @role = Role.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def role_params
      params.permit(:name, :desc, :active_role, :created_by) #.require(:role)
    end
end
end
