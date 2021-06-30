require 'sinatra'
require 'sinatra/reloader'
require 'dm-core'
require 'dm-migrations'

DataMapper.setup(:default, "sqlite3://#{Dir.pwd}/bets.db")

class Bets
  include DataMapper::Resource
  property :id, Serial
  property :user, Text
  property :accountWin, Integer
  property :accountLoss, Integer
  property :accountProfit, Integer
end

DataMapper.finalize
Bets.auto_upgrade!

configure do
  enable :sessions
  set :user, "frank"                    #shows in irb
  set :password, "sinatra"
end

get '/' do
  erb :login
end

get '/login' do 
  if session[:login]
    redirect '/betting'
  end
end

#comapres user info to db
post '/login' do
  if params[:user] == settings.user && params[:password] == settings.password
    session[:login] = true
    session[:name] = params[:user]
    session[:totalWin] = 0
    session[:totalLoss] = 0
    session[:totalProfit] = 0
    @bet = Bets.first
    redirect '/betting'
  else
    session[:message] = "Erro"
    redirect '/'
  end
end

#get method gets information form session
get '/betting' do
  @totalWin = session[:totalWin]
  @totalLoss = session[:totalLoss]
  @totalProfit = session[:totalProfit]
  
  bet = Bets.first
  @accountWin = bet.accountWin
  @accountLoss = bet.accountLoss
  @accountProfit = bet.accountProfit
  
  erb :betting
end

#does actual betting
post '/betting' do
  @stake = params[:stake].to_i
  number = params[:number].to_i
  roll = rand(1..6)
  if number == roll
    save_win(5*@stake)
     @message = "The dice landed on #{roll}, you win #{5*@stake} dollars"
  else
    save_lost(@stake)
    @message = %{The dice landed on #{roll}, you lost #{@stake} dollars, the total lost is #{session[:totalLoss]} dollars.}
  end
  bet = Bets.first
  @accountWin = bet.accountWin
  @accountLoss = bet.accountLoss
  @accountProfit = bet.accountProfit
  erb :betting
end


#upon logging out saves info
post '/logout' do
  bet = Bets.first
  bet.accountWin += session[:totalWin]
  bet.accountLoss += session[:totalLoss]
  bet.accountProfit += session[:totalProfit]
  bet.save
  session[:totalWin] = nil
  session[:totalLoss] = nil
  session[:totalProfit] = nil
  redirect '/'  #go back to login
end

def save_win(money)
  session[:totalWin] = session[:totalWin] + money
  session[:totalProfit] = session[:totalProfit] + money
  @totalWin = session[:totalWin]
  @totalLoss = session[:totalLoss]
  @totalProfit = session[:totalProfit]
end

def save_lost(money)
  session[:totalLoss] = session[:totalLoss] + money
  session[:totalProfit] = session[:totalProfit] - money
  @totalWin = session[:totalWin]
  @totalLoss = session[:totalLoss]
  @totalProfit = session[:totalProfit]
end



