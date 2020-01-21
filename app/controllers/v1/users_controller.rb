module V1
class UsersController < ApplicationController
 before_action :authenticate_user!, only: [:confirm]
  def index
    user = User.all
     if user
       render json: { user: user }, status: :created
     else
       render json: { error: "There are no records of users" }, status: :not_found
     end
  end

  def unconfirmed_users
    user = User.where(:confirmed_at => nil)
     if user
       render json: { user: user }, status: :created
     else
       render json: { error: "There are no records of users" }, status: :not_found
     end
  end

  def create
    user = User.new(user_params)
    device = params[:device] if params[:device]

    if user.save
      token = WebToken.encode(user, device)
      render json: { token: token }, status: :created
      #render json: @user.as_json(only: [:id, :email, :username]), status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :bad_request
    end
  end

  def login
    @user = User.find_by(email: params[:email].to_s.downcase)

    if @user && @user.authenticate(params[:password])
      device = params[:device] if params[:device]
      token = WebToken.encode(@user, device)
      #render json: {token: token}, status: :ok
      #render :login, status: :created, location: v1_user_url(@user, @token)
      render :login, status: :created, locals: { token: token }

    else
      render json: {error: 'Invalid username / password'}, status: :unauthorized
    end
  end

  def logout
   if params[:token]

   else

   end
  end

  def confirm_token
      token = params[:token].to_s
      if @current_user.phone_token == token  ##  && @current_user.confirmation_token_valid?
          @current_user.mark_as_phone_confirmed!
        render json: {status: 'User confirmed successfully'}, status: :ok
      elsif @current_user.email_token == token ##  && @current_user.confirmation_token_valid?
         @current_user.mark_as_email_confirmed
        render json: {status: 'User confirmed successfully'}, status: :ok
      elsif @current_user.phone_token == nil
        render json: {status: 'Invalid token or has already been used'}, status: :not_found
      elsif @current_user.email_token == nil
        render json: {status: 'Invalid token or has already been used'}, status: :not_found
      else
        render json: {status: 'Invalid token'}, status: :not_found
      end
  end  

  private

  def user_params
    params.permit(:username, :phone, :email, :password, :password_confirmation, :phone_token, :email_token)
  end

end
end
