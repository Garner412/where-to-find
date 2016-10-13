# Test to see if sesions need to be enabled in controller (exists in environment)
enable :sessions

get '/sessions/new' do
  erb :'sessions/new'
end

post '/sessions' do
  @user = User.find_by(username: params[:username])
  if @user && @user.authenticate(params[:password])
    session[:user_id] = @user.id
    redirect "/users/#{@user.id}"
  else
    @error = "Error: Incorrect username or password"
    erb :'sessions/new'
  end
end

delete '/sessions' do
  session.delete(:user_id)
  redirect '/'
end






def login
  @user = User.find_by_email(params[:email])
  if @user.password == params[:password]
    give_token
  else
    redirect_to home_url
  end
end
