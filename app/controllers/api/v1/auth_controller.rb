class Api::V1::AuthController < ApplicationController
  skip_before_action :authorized, only: [:create]

  def create
    @coach = Coach.find_by(username: user_login_params[:username])
    @player = Player.find_by(username: user_login_params[:username])
    if @coach && @coach.authenticate(user_login_params[:password])
      token = encode_token({coach_id: @coach.id})
      render json: {type: "coach", user: CoachSerializer.new(@coach), jwt: token}, status: :accepted
    elsif @player && @player.authenticate(user_login_params[:password])
      token = encode_token({player_id: @player.id})
      render json: {type: "player", user: PlayerSerializer.new(@player), jwt: token}, status: :accepted
    else
      render json: {message: 'Invalid username or password'}, status: :unauthorized
    end
  end

  private
  def user_login_params
    params.require(:user).permit(:username, :password)
  end
end
