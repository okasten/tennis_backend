class Api::V1::GoalsController < ApplicationController
  before_action :find_user, only: [:create]
  skip_before_action :authorized, only: [:create, :index, :update, :delete]

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
