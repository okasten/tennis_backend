class Api::V1::ConversationsController < ApplicationController
  before_action :find_user, except: [:markRead, :unread]
  skip_before_action :authorized, only: [:create, :index, :update, :destroy, :markRead, :unread]

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

    @message = Message.create(to: @receiver.name, from: @user.name, subject: message_params[:subject], content: message_params[:content], conversation: @conversation, read: false)

    render json: @conversation
  end

  def markRead
    @conversation = Conversation.find(params[:id])
    @conversation.messages.each{|message| message.update(read: true)}
    render json: @conversation
  end

  def unread
    if params[:type] == "player"
      @user = Player.find(params[:user_id])
    else
      @user = Coach.find(params[:user_id])
    end

    @numberUnread = @user.messages.select{ |message|  message[:read] == false}.length
    render json: @numberUnread
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
