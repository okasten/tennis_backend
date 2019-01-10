class Api::V1::AuthController < ApplicationController
  skip_before_action :authorized, only: [:create]

  def create
    @coach = Coach.find_by(username: user_login_params[:username])
    if @coach && @coach.authenticate(user_login_params[:password])
      token = encode_token({coach_id: @coach.id})
      render json: {coach: CoachSerializer.new(@coach), jwt: token}, status: :accepted
    else
      render json: {message: 'Invalid username or password'}, status: :unauthorized
    end
  end

  private
  def user_login_params
    params.require(:user).permit(:username, :password)
  end
end
