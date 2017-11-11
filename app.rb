require 'sinatra'
require 'json'
require 'pry'

get '/' do
  " I got some JSON: "
end

post '/payload' do
  push = JSON.parse(request.body.read)
  puts "I got some JSON: #{push.inspect}"
end

