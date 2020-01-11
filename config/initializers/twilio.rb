Twilio.configure do |config|
  config.account_sid = ENV['TWILIO_ACCOUNT_SID']
  config.auth_token = ENV['TWILIO_AUTH_TOKEN']
end

def send_twilio_sms recipient_phone_number, msg
  client = Twilio::REST::Client.new
   client.messages.create({
     from: ENV['TWILIO_PHONE_NUMBER'],
     to: recipient_phone_number,
     body: msg
   })
end
