# frozen_string_literal: true

require 'twilio-ruby'
require 'dotenv-rails'

class TwilioController < ApplicationController
  def text
    account_sid = ENV['TWILIO_ACCOUNT_SID_DEVELOPMENT']
    auth_token = ENV['TWILIO_AUTH_TOKEN_DEVELOPMENT']

    @client = Twilio::REST::Client.new account_sid, auth_token
    message = @client.messages.create(
      body: twilio_params[:body],
      to: twilio_params[:to],
      from: '+16174058594'
    )
    puts message.sid
  end

  private

  # Only allow a trusted parameter "white list" through.
  def twilio_params
    params.require(:twilio).permit(:to, :body)
  end
end
