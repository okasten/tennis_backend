class Api::V1::LessonsController < ApplicationController
  before_action :find_user
  skip_before_action :authorized, only: [:create, :index, :update]

  def index
    @lessons = @user.lessons
    render json: @lessons
  end

  def create
    @lesson = Lesson.create(coach: @user, date: lesson_params[:date], time: lesson_params[:time], notes: lesson_params[:notes], player_id: lesson_params[:player])

    render json: @lesson
  end

  def update
    @lesson = Lesson.find(lesson_params[:id])
    @lesson.update(lesson_params)
    render json: @lesson
  end


  private

  def lesson_params
    params.require(:lesson).permit(:id, :date, :time, :player, :notes, :coach)
  end

  def find_user
    if params[:coach_id]
      @user = Coach.find(params[:coach_id])
    elsif params[:player_id]
      @user = Player.find(params[:player_id])
    end
  end
end
