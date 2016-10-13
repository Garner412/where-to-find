get '/users/new' do
  erb :'users/new'
end

post '/users' do
  new_user = User.new(params[:user])
  new_user.password = params[:password]
  if new_user.save
    session[:user_id] = new_user.id
    redirect "/users/#{new_user.id}"
  else
    @messages = new_user.errors.full_messages
    erb :'users/new'
  end
end


get '/users/:id' do
  if owner?(User.find(params[:id]))
    erb :'users/show'
  else
    redirect '/'
  end
end
