require 'sinatra'
require 'json'
require 'pry'

class App < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  # routingの設定
  get '/' do
    " I got some JSON: "
  end

  post '/payload' do
    push = JSON.parse(request.body.read)
    puts "I got some JSON: #{push.inspect}"
  end

end

