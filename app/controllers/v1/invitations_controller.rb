module V1
class InvitationsController < ApplicationController
  before_action :set_invitation, only: [:show, :update, :destroy, :revoke_invite, :admin_confirmation ]
  before_action :authenticate_user!

  # GET /invitations
  # GET /invitations.json

  def admin_confirmation
    #@invitation = Invitation.where(:id => params[:id], :revoked_invite => false)
    @invitation.update(
             :admin_confirmed => true,
             :admin_confirmed_at => Time.now,
             :admin_confirmed_by => @current_user.id
           )
     if @invitation.present?
        render :show, status: :updated, location: v1_invitation_url(@invitation)
     else
        render json: {status: "Invitation not found or may be deleted"}, status: :not_found
     end

  end

  def get_user_record
    if params[:email].present?
      @user = User.where(:email => params[:email], :confirmation_token => nil).first
      if @user.present?
        render :user_record, status: :created, location: v1_user_url(@user)
      else
        render json: {status: "Email doesn't exist"}, status: :not_found
      end
    elsif params[:phone].present?
      @user = User.where(:phone => params[:phone], :confirmation_token => nil).first
    #  binding.pry
        if @user.present?
          render :user_record, status: :created, location: v1_user_url(@user)
        else
          render json: {status: "Phone doesn't exist"}, status: :not_found
        end
    elsif params[:username].present?
      @user = User.where(:username => params[:username], :confirmation_token => nil).first
        if @user.present?
          render :user_record, status: :created, location: v1_user_url(@user)
        else
          render json: {status: "Username doesn't exist"}, status: :not_found
        end
    else
      render json: {status: "User doesn't have an acccount yet"}, status: :not_found
    end
  end

  def revoke_invite
     @invitation.update(
              :revoked_invite => true,
              # :invite_revoked_by => @current_user.id
            )
      if @invitation.present?
         render :show, status: :updated, location: v1_invitation_url(@invitation)
      else
         render json: {status: "Invitation not found or may be deleted"}, status: :not_found
      end
  end

  def confirm_invite
    if params[:phone_token].present?
       type = 'phone_token'
    else
        type = 'email_token'
    end
     @invitation = Invitation.where(type.to_sym => params[type.to_sym], :revoked_invite => false).first
     binding.pry
     if params[:phone_token].present? and @invitation.present?
        @invitation.update(
            :user_id => @current_user.id,
            :phone_token => nil,
            :email_token => nil,
            :phone_confirmed_time =>  Time.now,
            :confirmed_by_phone =>  true,
            :email_confirmed_time => nil,
            :confirmed_by_email => nil
            )
          render :show, status: :updated, location: v1_invitation_url(@invitation)
      elsif params[:email_token].present? and @invitation.present?
        @invitation.update!(
            :user_id => @current_user.id,
            :phone_token => nil,
            :email_token => nil,
            :phone_confirmed_time => nil,
            :confirmed_by_phone =>  nil,
            :email_confirmed_time => Time.now,
            :confirmed_by_email => true
            )
        render :show, status: :updated, location: v1_invitation_url(@invitation)
      else
          render json: {status: "Token has been used"}, status: :not_found
      end

  end

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
    @invitation.inviter = @current_user.id
    @invitation.email_token = SecureRandom.hex(8)
    @invitation.phone_token = SecureRandom.hex(4).upcase
    @invitation.invitation_role = invite_role
    @invitation.user_id = get_user_id
    @invitation.dairy_id = get_dairy_id

    if @invitation.save
      render :show, status: :created, location: v1_invitation_url(@invitation)
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
      params.permit(:username, :phone, :email, :phone_token, :email_token, :dairy_id, :user_id, :invitation_role, :confirmed_by_phone, :confirmed_by_email, :inviter, :revoked_invite)
    end

    def invite_role
      if params[:invitation_role].present?
         params[:invitation_role]
      else
        return  nil
      end
    end

    def get_user_id
       if params[:user_id].present?
         params[:user_id]
      elsif params[:user_id].blank?
        user = User.where(phone: params[:phone]).or(User.where(email: params[:email]))
        return user.first.id if user.present?
      else
        return nil
      end
    end

    def get_dairy_id
      if params[:dairy_id].present?
         params[:dairy_id]
      elsif params[:dairy_id].blank?
        user = User.find_by_id(@current_user.id)
        return user.dairies.first.id if user.dairies.count == 1
      else
        return nil
      end
    end

end
end
