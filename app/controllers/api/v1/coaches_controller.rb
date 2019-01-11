class Api::V1::CoachesController < ApplicationController
  # before_action :find_user, only: [:index]
  skip_before_action :authorized, only: [:create, :index]

  def profile
    render json: {type: "coach", user: CoachSerializer.new(current_user)}, status: :accepted
  end

  def index
    byebug
  end

  def create
    @coach = Coach.create(coach_params)
    if @coach.valid?
      @token = encode_token(coach_id: @coach.id)
      render json: {type: "coach", user: CoachSerializer.new(@coach), jwt: @token}, status: :created
    else
      render json: {error: 'failed to create user'}, status: :not_acceptable
    end
  end

  private
  def coach_params
    params.require(:coaches).permit(:username, :password, :email, :name)
  end
end
