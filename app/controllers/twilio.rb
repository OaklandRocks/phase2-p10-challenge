require 'twilio-ruby'
get '/send_sms' do
  erb :twilio
end
post '/send_sms' do
   message = params[:message]
   path = params[:path]
   p params
   p path
   number = params[:number]
   account_sid = ENV['TWILIO_ACCOUNT_SID']
   auth_token = ENV['TWILIO_AUTH_TOKEN']

   @client = Twilio::REST::Client.new account_sid, auth_token

   @message = @client.account.messages.create({:to => "+1"+"#{number}",
            :from => '+14844699443',
            :to => '+12154954441',
            :body => "#{message}",
            :media_url => 'https://farm3.staticflickr.com/2533/4042396217_33e08e2df6_m.jpg'
            })
             redirect '/confirmation'
end
get '/confirmation' do
  erb :confirmation
end

# "http//:herokuapp/uploads/photos/#{path}"
