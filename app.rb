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
    :to =>'czztdevelopment@gmail.com',
    :via =>:smtp,
    :via_options => {
        :address => 'smtp.sendgrid.net',
        :port => '587',
        :user_name => ENV['SENDGRID_USERNAME'],
        :password => ENV['SENDGRID_PASSWORD'],
        :authentication => :plain,
        :enable_starttls_auto => true,
        :domain               => 'czzt.herokuapp.com',
  }
})
  redirect '/'
  end

  get '/engindex.erb' do
    erb :engindex
  end


end
