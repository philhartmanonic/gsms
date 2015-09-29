class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def smsing
    require 'twilio-ruby'
    account_sid = 'AC5ca2efa6aab7d8a0c1888fd7ffb69e19'
    auth_token = 'c0271359ec3a855f5f7f4dd64f5c99c6'
    @client = Twilio::REST::Client.new account_sid, auth_token
    send = @client.account.messages.create(:body => note,
                                           :to => receive,
                                           :from => '+16305282554')
    puts message.to
  end
end
