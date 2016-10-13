get '/users/new' do
  if request.xhr?
    erb :'users/_new', layout: false, locals: { errors: @errors }
  else
    erb :'users/new'
  end
end

post '/users' do
  new_user = User.new(params[:user])
  new_user.password = params[:password]
  if new_user.save
    session[:user_id] = new_user.id
    redirect "/users/#{new_user.id}"
  else
    @errors = new_user.errors.full_messages
    erb :'users/new'
  end
end


get '/users/:id' do
  @user = User.find(params[:id])
  @questions = @user.questions
  @answers = @user.answers
  if owner?(@user)
    erb :'users/show'
  else
    redirect '/'
  end
end
