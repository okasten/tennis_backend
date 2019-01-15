class Api::V1::MessagesController < ApplicationController
  before_action :find_user
  skip_before_action :authorized, only: [:create, :index, :update, :destroy]

  def index
    @conversation = Conversation.find(get_conversation)
    @messages = @conversation.messages

    render json: @messages
  end

  def create

    @conversation = Conversation.find(get_conversation)

    if @user == @conversation.player
      @receiver = @conversation.coach
    else
      @receier = @conversation.player
    end
    @time = Time.now().to_s.split(" ")
    
    @message = Message.create(conversation: @conversation, content: params[:message][:content], read: false, from: @user, to: @receiver, subject: @conversation.messages.first.subject, date: @time[0], time: @time[1])

    render json: @message

  end


  private

  def message_params
    params.require(:message)
  end

  def get_conversation
    params.require(:conversation_id)
  end

  def find_user
    if params[:coach]
      @user = Coach.find(params[:coach][:id])
    elsif params[:player]
      @user = Player.find(params[:player][:id])
    end
  end

end
