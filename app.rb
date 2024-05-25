require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'

get '/' do
	erb "Hello! <a href=\"https://github.com/bootstrap-ruby/sinatra-bootstrap\">Original</a> pattern has been modified for <a href=\"http://rubyschool.us/\">Ruby School</a>"			
end

get '/about' do
	@error = 'Something wrong!'
	erb :about
end

get '/visit' do
	erb :visit
end

get '/contacts' do
	erb :contacts
end

post '/visit' do
	@username = params[:username]
	@phone = params[:phone]
	@datetime = params[:datetime]
	@persons = params[:persons]
	@color = params[:color]

	if @username == ''
		@error = 'Введите имя'
		return erb :visit
	end

	@title = 'Спасибо!'
	@message = "Уважаемый #{@username}, #{@phone}, мы вас ждём #{@datetime}, ваш парикмахер #{@persons}, выбранный цвет окраски волос: #{@color}"

	f = File.open './public/users.txt', 'a'
	f.write "User: #{@username}, Phone: #{@phone}, Date and time: #{@datetime}, Persons: #{@persons}, Color: #{@color}\n"
	f.close

	erb :message
end

post '/contacts' do
	@email = params[:email]
	@messages = params[:messages]

	@title = 'Спасибо!'
	@message = "Уважаемый клиент, мы вам ответим в самое ближайшее время на вашу почту #{@email}"

	f = File.open './public/contacts.txt', 'a'
	f.write " Email: #{@email}, Messages: #{@messages}"
	f.close

	erb :message
end
