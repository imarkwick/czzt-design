require 'sinatra'
require 'pony'
require 'byebug'
require 'sinatra/base'
require 'rack'
# use Rack::Flash


class Application < Sinatra::Base
  get '/' do
    erb :index
  end

 post '/' do
   Pony.mail({
    :from =>params[:emailaddress],
    :subject =>params[:name],
    :body =>params[:body],  
    :to =>'claretrembath@ymail.com',
    :via =>:smtp,
    :via_options => {
        :address => 'smtp.sendgrid.net',
        :port => '587',
        :user_name => ENV['SENDGRID_USERNAME'],
        :password => ENV['SENDGRID_PASSWORD'],
        :authentication => :plain,
        :enable_starttls_auto => true,
        :domain               => 'localhost.9292',
  }
})
  redirect '/'
  end


def send_message
    Pony.mail({
    :from =>params[:emailaddress],
    :subject =>params[:from],
    :body =>params[:body],  
    :to =>'claretrembath@ymail.com',
    :via =>:smtp,
    :via_options => {
        :address => 'smtp.sendgrid.net',
        :port => '587',
        :user_name => ENV['SENDGRID_USERNAME'],
        :password => ENV['SENDGRID_PASSWORD'],
        :authentication => :plain,
        :enable_starttls_auto => true,
        :domain               => 'localhost.9292',
  }
})
end
end
