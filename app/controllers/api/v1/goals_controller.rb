class Api::V1::GoalsController < ApplicationController
  before_action :find_user, only: [:create]
  skip_before_action :authorized, only: [:create, :index, :update, :delete, :meet, :usergoals]

  def index
    @goal = Goal.find(params[:id])
    render json: @goal
  end

  def usergoals
    @user = Player.find(params[:id])
    @goals = @user.goals
    render json: @goals
  end

  def create
    @goal = Goal.create(player: @user)
    @goal.update(goal_params)
    render json: @goal
  end

  def update
    @goal = Goal.find(params[:id])
    @goal.update(update_params)
    render json: @goal
  end

  def meet
    @goal = Goal.find(params[:id])
    @date = Time.now
    @date = @date.to_s[0, 10]

    @goal.update(met: true, dateMet: @date)
    render json: @goal
  end

  def delete
    @goal = Goal.find(params[:id])
    @goal.destroy!

  end

  private

  def goal_params
    params.require(:goal).permit(:objective, :kind, :notes, :met)
  end

  def update_params
    params.require(:goal).permit(:objective, :notes)
  end

  def find_user
    @user = Player.find(params[:player_id])
  end
end
