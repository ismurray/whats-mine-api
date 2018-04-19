# frozen_string_literal: true

require 'twilio-ruby'
# require 'dotenv-rails'

class TwilioController < ProtectedController
  def text
    # p 'current user.items is', current_user.items
    set_resources
    construct_message
    p 'body is ', @body
    Phonelib.default_country = 'US'
    account_sid = ENV['TWILIO_ACCOUNT_SID_DEVELOPMENT']
    auth_token = ENV['TWILIO_AUTH_TOKEN_DEVELOPMENT']

    if Phonelib.valid? @recipient.phone
      @client = Twilio::REST::Client.new account_sid, auth_token
      message = @client.messages.create(
        body: @body,
        to: @recipient.phone,
        from: '+16174058594'
      )
      puts message.sid
      render json: { message: @body }, status: :created
    else
      head :not_found
    end
  end

  private

  def set_resources
    @item = current_user.items.find(twilio_params[:item_id])
    @box = current_user.boxes.find(twilio_params[:box_id])
    @recipient = @box.users.find(twilio_params[:user_id])
  end

  def construct_message
    @body = "[WhatsMine Message] Hi #{@recipient.email}, #{current_user.email} sent a reminder about Item: '#{@item.name}' in Box: '#{@box.name}'!"
  end

  # Only allow a trusted parameter "white list" through.
  def twilio_params
    params.require(:twilio).permit(:user_id, :box_id, :item_id, :body)
  end
end
