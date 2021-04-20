require "sinatra"
require_relative "./lib/counter"

class CounterApp < Sinatra::Base

  before do
    @counter = Counter.instance
  end

  get '/' do
    p @counter
    erb :index
  end

  post '/increment' do
    @counter.increment
    redirect '/'
  end

  post '/decrement' do
    @counter.decrement
    redirect '/'
  end 

  post '/reset' do
    @counter.reset
    redirect '/'
  end 
end
