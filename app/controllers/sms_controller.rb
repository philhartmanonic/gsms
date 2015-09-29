class SmsController < ApplicationController
  def create
    require 'twilio-ruby'
    account_sid = 'AC5ca2efa6aab7d8a0c1888fd7ffb69e19'
    auth_token = 'c0271359ec3a855f5f7f4dd64f5c99c6'
    pretoo = params[:smsTo]
    too = ''
    nums = ['0','1','2','3','4','5','6','7','8','9']
    pretoo.split('').each do |i|
      too += i if nums.include?(i)
    end
    if too[0] == '1'
      
      too = '+' + too
    else
      too = '+1' + too
    end
      
      
    @client = Twilio::REST::Client.new account_sid, auth_token
    message = @client.account.messages.create(:body => params[:note],
                                           :to => too,
                                           :from => '+16305282554')
    puts message.to
  end
end