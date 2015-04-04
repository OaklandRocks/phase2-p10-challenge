require 'twilio-ruby'


get '/send_sms/photo/:id' do
  @photo= Photo.find(params[:id])
  erb :twilio
end
post '/send_sms' do
   message = params[:message]
   path = params[:path]
   photo = params[:photopath]
   p path
   number = params[:number]
   account_sid = ENV['TWILIO_ACCOUNT_SID']
   auth_token = ENV['TWILIO_AUTH_TOKEN']

   @client = Twilio::REST::Client.new account_sid, auth_token

   @message = @client.account.messages.create({:to => "+1"+"#{number}",
            :from => '+14844699443',
            :to =>    "#{number}",
            :body =>  "#{message}",
            :media_url => "#{photo}"
            })
             redirect '/confirmation'
end

get '/confirmation' do
  erb :confirmation
end

# "http//:herokuapp/uploads/photos/#{path}"
