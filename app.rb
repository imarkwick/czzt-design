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
    }
  }
  
  Pony.mail(options)
  
  redirect '/'
end
end

