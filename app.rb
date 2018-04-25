require "sinatra"
require "sinatra/activerecord"

require_relative './models/attendee'
require_relative './models/happyhour'

set :database, {adapter: 'postgresql', database: 'happyhour'}

get '/attendees' do
	@attendees = Attendee.all
	erb :index
end 

get '/attendees/new/create' do 
	erb :new
end 

post '/attendees/new' do
	@attendee = Attendee.create(first: params[:first], last: params[:last], age: params[:age], likes_beer: params[:likes_beer])
	redirect ("/attendees")
end 

get '/attendees/:id' do
	@attendee = Attendee.find(params[:id])
	erb :attendee
end 

get '/attendees/:id/edit' do 
	@attendee = Attendee.find(params[:id])
	erb :edit
end 

put '/attendees/:id' do
	@attendee = Attendee.find(params[:id])
	@attendee.update(age: params[:age], likes_beer: params[:likes_beer])
	redirect ("/attendees/#{@attendee.id}")
end 

delete '/attendees/:id' do
	@attendee = Attendee.find(params[:id])
	@attendee.destroy
	redirect ("/attendees")
end 

get '/happyhours' do
	@happyhours = Happyhour.all
	erb :happyhour_index
end 

get '/happyhours/new/create' do 
	erb :happyhour_new
end 

post '/happyhours/new' do
	@happyhour = Happyhour.create(name: params[:name], location: params[:location], capacity: params[:capacity])
	redirect ("/happyhours")
end 

get '/happyhours/:id' do
	@happyhour = Happyhour.find(params[:id])
	erb :happyhour
end 

get '/happyhours/:id/edit' do 
	@happyhour = Happyhour.find(params[:id])
	erb :happyhour_edit
end 

put '/happyhours/:id' do
	@happyhour = Happyhour.find(params[:id])
	@happyhour.update(location: params[:location], capacity: params[:capacity])
	redirect ("/happyhours/#{@happyhour.id}")
end 

delete '/happyhours/:id' do
	@happyhour = Happyhour.find(params[:id])
	@happyhour.destroy
	redirect ("/happyhours")
end 