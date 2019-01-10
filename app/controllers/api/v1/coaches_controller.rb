class Api::V1::CoachesController < ApplicationController

  skip_before_action :authorized, only: [:create]

  def create
    @coach = Coach.create(coach_params)
    if @coach.valid?
      @token = encode_token(coach_id: @coach.id)
      render json: {coach: CoachSerializer.new(@coach), jwt: @token}, status: :created
    else
      render json: {error: 'failed to create user'}, status: :not_acceptable
    end
  end

  private
  def coach_params
    params.require(:coaches).permit(:username, :password, :email, :name)
  end
end
