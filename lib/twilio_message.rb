require_relative './twilio-ruby'
require_relative '../dotenv/load'

class TwilioMessage
    def initialize
      @account_sid = ENV["ACCOUNT_SID"]
      @auth_token = ENV["AUTH_TOKEN"]
      @from_number = ENV["FROM_NUMBER"]
      @client = Twilio::REST::Client.new(@account_sid,@auth_token)
    end

    def send_message(message, to_number="+447850163626")
      message = @client.messages.create(
      from: @from_number, 
      to: to_number,
      body: message )
    end
  end