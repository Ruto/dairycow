module V1
class UsersController < ApplicationController
  def create
    user = User.new(user_params)
    device = params[:device] if params[:device]
    token = WebToken.encode(user, device)

    if user.save
      render json: { token: token }, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :bad_request
    end
  end

  def login
    user = User.find_by(email: params[:email].to_s.downcase)

    if user && user.authenticate(params[:password])
      if user.confirmed_at?
        device = params[:device] if params[:device]
        token = WebToken.encode(user, device)
        render json: {token: token}, status: :ok
      else
        render json: {error: 'Email not verified' }, status: :unauthorized
      end
    else
      render json: {error: 'Invalid username / password'}, status: :unauthorized
    end
  end

  def confirm
      token = params[:token].to_s

      user = User.find_by(confirmation_token: token)

      if user.present? && user.confirmation_token_valid?
        user.mark_as_confirmed!
        render json: {status: 'User confirmed successfully'}, status: :ok
      else
        render json: {status: 'Invalid token'}, status: :not_found
      end
   end


  private

  def user_params
    params.permit(:username, :phone, :email, :password, :password_confirmation, :device)
  end
end
end
