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

post '/contacts' do
	@cont_email = params[:cont_email]
	@cont_message = params[:cont_message]

		cont_data = File.open 'public/contacts.txt', 'a'
		cont_data.write "Email: #{@cont_email}\nMessage: #{@cont_message}\n\n"
		cont_data.close

		@message = "Thank you! We will contact you as soon is possible"
	erb :contacts
end
