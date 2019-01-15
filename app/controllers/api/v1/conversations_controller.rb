class Api::V1::ConversationsController < ApplicationController
  before_action :find_user
  skip_before_action :authorized, only: [:create, :index, :update, :destroy]

  def index
    @conversations = @user.conversations
    render json: @conversations
  end

  def create
    if @user.is_a? Coach
      @receiver = Player.find(find_to[:to])
      @conversation = Conversation.create(coach: @user, player: @receiver)
    else
      @receiver = Coach.find(find_to[:to])
      @conversation = Conversation.create(player: @user, coach: @receiver)
    end

    @message = Message.create(to: @receiver, from: @user, subject: message_params[:subject], content: message_params[:content], conversation: @conversation, read: false)

    render json: @conversation
  end


  private

  def message_params
    params.require(:message).permit(:to, :subject, :content)
  end

  def find_to
    params.require(:message).permit(:to)

  end


  def find_user
    if params[:coach_id]
      @user = Coach.find(params[:coach_id])
    elsif params[:player_id]
      @user = Player.find(params[:player_id])
    end
  end
end
