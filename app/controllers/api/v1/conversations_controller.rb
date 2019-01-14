class Api::V1::ConversationsController < ApplicationController
  before_action :find_user
  skip_before_action :authorized, only: [:create, :index, :update, :destroy]

  def index
    @conversations = @user.conversations
    render json: @conversations
  end

  def create

    if @user.is_a? Coach
      @receiver = Player.find_by(name: find_to[:to])
      @conversation = Conversation.create(coach: @user, player: @receiver)
    else
      @receiver = Coach.find_by(name: find_to[:to])
      @conversation = Conversation.create(player: @user, coach: @receiver)
    end
    render json: @conversation
  end
  private

  def find_to
    params.require(:message).permit(:to)

  end


  def find_user
    if params[:coach_id]
      @user = Coach.find(params[:player_id])
    elsif params[:player_id]
      @user = Player.find(params[:player_id])
    end
  end
end
