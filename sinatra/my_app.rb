class MyApp < Sinatra::Base
	get '/' do 
		@name = "Phuong"
		erb :index
	end
	get '/books' do 
		@books =['TiengViet', 'Toan', 'Anh Van']
		erb :books
	end

	get '/users' do 
		client = Mysql2::Client.new(host:'localhost', username:'root', password:'123456789', database:'db_test')
		
		@cdr_result = client.query("SELECT * from users")
		erb :users
	end
	get '/users/new' do 
		erb :new
	end

	post '/users' do 
		client = Mysql2::Client.new(host:'localhost', username:'root', password:'123456789', database:'db_test')
		client.query("INSERT INTO users(name, password) VALUE (\'#{params['name']}\',\'#{params['password']}\')")
		redirect '/users'	
	end

	get '/users/delete/:id' do 
		client = Mysql2::Client.new(host:'localhost', username:'root', password:'123456789', database:'db_test')
		client.query("DELETE from users WHERE id =#{params[:id]}")
		redirect '/users'
	end

	get '/users/update/:id' do 
		client = Mysql2::Client.new(host:'localhost', username:'root', password:'123456789', database:'db_test')
		@result = client.query("SELECT * from users where id =#{params[:id]}")
		erb :update
	end

	post '/users/update' do 
		client = Mysql2::Client.new(host:'localhost', username:'root', password:'123456789', database:'db_test')
		client.query("UPDATE users SET name=\'#{params['name']}\', password = \'#{params['password']}\' where id =#{params['id']}")
		redirect '/users'
	end


end