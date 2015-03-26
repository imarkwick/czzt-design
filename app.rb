require 'sinatra'

class HelloWorldApp < Sinatra::Base
  get '/' do
    erb :index
  end
end