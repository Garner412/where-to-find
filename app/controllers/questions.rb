get '/questions' do
  @questions = Question.all
  erb :'questions/index'
end

post '/questions' do
  @question = Question.new(params[:question])
  if @question.save
    redirect "/questions/#{@question.id}"
  else
    redirect '/'
  end
end

get '/questions/new' do
  @question = Question.new
  @method = "Post"
  @action = "/questions/"
  if logged_in?
    erb :'/questions/new'
  else
    redirect '/'
  end
end

get '/questions/:id' do
  @question = Question.find_by(id: params[:id])
  erb :'questions/show'
end

get '/questions/:id/edit' do
  @question = Question.find_by(id: params[:id])
  @method = "Put"
  @action = "/questions/#{@question.id}"
  if owner?(@question.user)
    erb :'questions/edit'
  else
    redirect "/questions/#{params[:id]}"
  end
end

put '/questions/:id' do
  @question = Question.find_by(id: params[:id])
  @question.update_attributes(params[:question])
  if @question.persisted?
    redirect "/questions/#{params[:id]}"
  else
    @errors = @question.errors.full_messages
    erb :'questions/edit'
  end
end

delete '/questions/:id' do
  # @question = Question.find_by(id: params[:id])
end

