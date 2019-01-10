class Api::V1::CoachesController < ApplicationController
  def create
    @coach = Coach.create(coach_params)
    if @coach.valid?
      render json: {coach: CoachSerializer.new(@coach)}, status: :created
    else
      render json: {error: 'failed to create user'}, status: :not_acceptable
    end
  end

  private
  def coach_params
    params.require(:coaches).permit(:username, :password_digest, :email, :name)
  end
end
