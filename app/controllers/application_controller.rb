class ApplicationController < ActionController::API
  before_action :authorized

  @@secret = Rails.application.credentials.my_secret_stuff

  def encode_token(payload)
    JWT.encode(payload, @@secret)
  end

  def auth_header
    request.headers['Authorization']
  end

  def decoded_token
    if auth_header
      token = auth_header.split(' ')[1]
      begin
        JWT.decode(token, @@secret, true, algorithm: 'HS256')
      rescue JWT::DecodeError
        nil
      end
    end
  end

  def current_user
    if decoded_token
      if decoded_token[0]['coach_id']
        user_id = decoded_token[0]['coach_id']
        @user = Coach.find_by(id: user_id)
      elsif decoded_token[0]['player_id']
        user_id = decoded_token[0]['player_id']
        @user = Player.find_by(id: user_id)
      end
    end
  end

  def logged_in?
    !!current_user
  end

  def authorized
    render json: {message: 'Please log in'}, status: :unauthorized unless logged_in?
  end
end
