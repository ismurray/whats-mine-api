# frozen_string_literal: true

require 'twilio-ruby'
require 'dotenv-rails'

class TwilioController < ApplicationController
  def text
    Phonelib.default_country = 'US'
    account_sid = ENV['TWILIO_ACCOUNT_SID_DEVELOPMENT']
    auth_token = ENV['TWILIO_AUTH_TOKEN_DEVELOPMENT']
    @recipient_phone = User.find(twilio_params[:user_id]).phone
    if Phonelib.valid? @recipient_phone
      @client = Twilio::REST::Client.new account_sid, auth_token
      message = @client.messages.create(
        body: twilio_params[:body],
        to: @recipient_phone,
        from: '+16174058594'
      )
      puts message.sid
      render json: message
    else
      head :not_found
    end
  end

  private

  # Only allow a trusted parameter "white list" through.
  def twilio_params
    params.require(:twilio).permit(:user_id, :body)
  end
end
