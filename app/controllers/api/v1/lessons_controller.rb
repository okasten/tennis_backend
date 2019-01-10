class Api::V1::LessonsController < ApplicationController
  before_action :find_user
  skip_before_action :authorized, only: [:create]

  def index
    byebug
  end

  def create
    # I need to create a student before I can create a lesson
    @coach_id = @user.id
    @lesson = Lesson.create(lesson_params)
    byebug
    render json: @lesson
  end


  private

  def lesson_params
    params.require(:lesson).permit(:date, :time, :player, :notes)
  end

  def find_user
    if params[:coach_id]
      @user = Coach.find(params[:coach_id])
    elsif params[:player_id]
      @user = Player.find(params[:coach_id])
    end
  end
end
