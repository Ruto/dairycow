module V1
class InvitationsController < ApplicationController
  before_action :set_invitation, only: [:show, :update, :destroy]

  # GET /invitations
  # GET /invitations.json
  def index
    @invitations = Invitation.all
  end

  # GET /invitations/1
  # GET /invitations/1.json
  def show
  end

  # POST /invitations
  # POST /invitations.json
  def create
    @invitation = Invitation.new(invitation_params)

    if @invitation.save
      render :show, status: :created, location: @invitation
    else
      render json: @invitation.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /invitations/1
  # PATCH/PUT /invitations/1.json
  def update
    if @invitation.update(invitation_params)
      render :show, status: :ok, location: @invitation
    else
      render json: @invitation.errors, status: :unprocessable_entity
    end
  end

  # DELETE /invitations/1
  # DELETE /invitations/1.json
  def destroy
    @invitation.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invitation
      @invitation = Invitation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def invitation_params
      params.require(:invitation).permit(:username, :phone, :email, :phone_token, :email_token, :dairy_id, :user_id, :invitation_role, :confirmed_by_phone, :phone_confirmed_time, :confirmed_by_email, :email_confirmed_time, :admin_confirmed_at, :admin_confirmed, :admin_confirmed_by, :inviter, :revoked_invite)
    end
end
end
