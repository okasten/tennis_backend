class Api::V1::PlayersController < ApplicationController
  skip_before_action :authorized, only: [:create, :index]

  def profile
    render json: {type: "player", user: PlayerSerializer.new(current_user)}, status: :accepted
  end

  def index
    @players = Player.all
    render json: @players
  end

  def create
    @player = Player.create(player_params)
    if @player.valid?
      @token = encode_token(player_id: @player.id)
      render json: {type: "player", user: PlayerSerializer.new(@player), jwt: @token}, status: :created
    else
      render json: {error: 'failed to create user'}, status: :not_acceptable
    end
  end

  private
  def player_params
    params.require(:players).permit(:username, :password, :email, :name)
  end
end
