class Api::V1::CoachesController < ApplicationController
   before_action :find_user, only: [:update]
  skip_before_action :authorized, only: [:create, :index, :update, :students]

  def profile
    render json: {type: "coach", user: CoachSerializer.new(current_user)}, status: :accepted
  end

  def students
    @coach = Coach.find(params[:coach_id])
    @students = @coach.players.uniq
    render json: @students
  end

  def index
    @coaches = Coach.all
    render json: @coaches
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

  def update
    @user.update(update_params)
    render json: @user
  end

  private

  def update_params
    params.require(:user).permit(:username, :name, :picture, :email)
  end

  def coach_params
    params.require(:coaches).permit(:username, :password, :email, :name)
  end

  def find_user
    @user = Coach.find(params[:id])
  end
end
