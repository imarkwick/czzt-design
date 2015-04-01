require 'sinatra'
require 'pony'
require 'rack-flash'

class Application < Sinatra::Base
  configure do
  end
  get '/' do
    erb :index
  end

 post '/' do
  send_message
  flash[:notice] = "Event updated"
  redirect '/'
end


def send_message
    Pony.mail({
    :to =>'claretrembath@ymail.com',
    :from =>params[:emailaddress],
    :subject =>params[:from],
    :body =>params[:body],  
    :via =>:smtp,
    :via_options => {
    :address => 'smtp.sendgrid.net',
    :port => '587',
    :user_name => ENV['SENDGRID_USERNAME'],
    :password => ENV['SENDGRID_PASSWORD'],
    :authentication => :plain,
    :enable_starttls_auto => true
  }
})
end
