require 'sinatra'
require 'pony'

class HelloWorldApp < Sinatra::Base
  get '/' do
    erb :index
  end

 post '/' do
  options = {
  :to => 'claretrembath@ymail.com',
  :from => params[:email],
  :subject => params[:name],
  :body => params[:message],
  :via => :smtp,
  :via_options => {
    :address => 'smtp.sendgrid.net',
    :port => '587',
    :domain => 'http://www.czzt.co.uk',
    :user_name => ENV['SENDGRID_USERNAME'],
    :password => ENV['SENDGRID_PASSWORD'],
    :authentication => :plain,
    :enable_starttls_auto => true
    }
  }
  
  Pony.mail(options)
  
  redirect '/'
end
end

