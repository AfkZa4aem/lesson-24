#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'

get '/' do
	erb "Hello! <a href=\"https://github.com/bootstrap-ruby/sinatra-bootstrap\">Original</a> pattern has been modified for <a href=\"http://rubyschool.us/\">Ruby School</a>"			
end

get '/about' do
	erb :about
end

get '/visit' do
	erb :visit
end

post '/visit' do
	@user_name = params[:user_name]
	@phone_number = params[:phone_number]
	@date_time = params[:date_time]

		data = File.open 'public/users.txt', 'a'
		data.write "Client: #{@user_name}; Phone: #{@phone_number}; Date-time: #{@date_time}\n"
		data.close

		@message = "Thank you #{@user_name}, we'll wait you at #{@date_time}"
	erb :visit
end

get '/contacts' do
	erb :contacts
end