get '/questions/:question_id/answers/new' do
  @question = Question.find_by(id: params[:question_id])
  if logged_in?
    erb :'answers/new'
  else
    redirect "/questions/#{@question.id}"
  end
end

post '/questions/:question_id/answers' do
  if logged_in?
    @question = Question.find_by(id: params[:question_id])
    answer = Answer.new(content: params[:content], question_id: params[:question_id], user_id: current_user.id)
    if answer.save
      redirect "/questions/#{@question.id}"
    else
      @errors = answer.errors.full_messages
      erb :'answers/new'
    end
  end
end

put '/questions/:question_id/answers/:answer_id' do

end
