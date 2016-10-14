# Test to see if sesions need to be enabled in controller (exists in environment)
enable :sessions

get '/sessions/new' do
  if request.xhr?
    erb :'/sessions/_new', layout: false, locals: { errors: @errors }
  else
    erb :'sessions/new'
  end
end

post '/sessions' do
  @user = User.find_by(username: params[:username])
  if @user && @user.authenticate(params[:password])
    session[:user_id] = @user.id
    if request.xhr?
      "http://localhost:9393/users/#{@user.id}"
    else
      redirect "/users/#{@user.id}"
    end
  else
    @errors = ["Incorrect Username and Password combination."]
    if request.xhr?
      status 422
      @errors
    else
      erb :'sessions/new'
    end
  end
end

delete '/sessions' do
  session[:user_id] = nil
  redirect '/'
end

