# frozen_string_literal: true

require 'twilio-ruby'
require 'dotenv-rails'

class TwilioController < ApplicationController
  include Webhookable

  after_action :set_header

  # skip_before_action :verify_authenticity_token

  def voice
    response = Twilio::TwiML::VoiceResponse.new do |r|
      r.say('hello there', voice: 'alice')
      r.dial(caller_id: '+14159992222') do |d|
        d.client 'jenny'
      end
    end

    # render_twiml response
    puts response.to_s
  end

  def text
    # Your Account SID from www.twilio.com/console
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    # Your Auth Token from www.twilio.com/console
    auth_token = ENV['TWILIO_AUTH_TOKEN']

    @client = Twilio::REST::Client.new account_sid, auth_token
    message = @client.messages.create(
      body: params[:foo],
      # Replace with your phone number
      to: '+18134173803',
      # Replace with your Twilio number
      from: '+16174058594'
    )

    puts message.sid
  end
end
