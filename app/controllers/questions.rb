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

put '/questions/:id' do
  # @question = Question.find_by(id: params[:id])
end

delete '/questions/:id' do
  # @question = Question.find_by(id: params[:id])

end

