get '/questions' do
  @questions = Question.all
  erb :'questions/index'
end

post '/questions' do
  # @question = Question.new()
  # if @question.save

  # else

  # end
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
