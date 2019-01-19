class Api::V1::LessonsController < ApplicationController
  before_action :find_user
  skip_before_action :authorized, only: [:create, :index, :update, :destroy]

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

    if params[:lesson][:player]
      @lesson.update(player_id: params[:lesson][:player][:id])

    else
      @lesson.update(lesson_params)

    end

    render json: @lesson
  end

  def destroy
    @lesson = Lesson.find(params[:id])

    @lesson.destroy!
  end


  private
# :id, :date, :time, :player, :notes, :coach
  def lesson_params
    params.require(:lesson).permit(:id, :player, :date, :time, :notes, :coach)
  end

  # def update_params
  #   params.require(:lesson).require(:player).permit(:id)
  # end

  def destroy_params
    params.permit(:id)
  end

  def find_user
    if params[:coach_id]
      @user = Coach.find(params[:coach_id])
    elsif params[:player_id]
      @user = Player.find(params[:player_id])
    end
  end
end
