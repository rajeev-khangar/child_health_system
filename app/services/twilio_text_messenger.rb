class TwilioTextMessenger
  
  def initialize(to , message)
    client = Twilio::REST::Client.new
    client.messages.create({from: Rails.application.secrets.twilio_phone_number,to: to ,body: message})
  end
end