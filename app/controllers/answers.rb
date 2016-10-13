get '/questions/:question_id/answers/new' do
  @question = Question.find_by(id: params[:question_id])
  erb :'answers/new'
end

post '/questions/:question_id/answers' do
  if logged_in?
    @question = Question.find_by(id: params[:question_id])
    answer = Answer.new(content: params[:content], question_id: params[:question_id], user_id: 1)
    if answer.save
      p @question
      redirect "/questions/#{@question.id}"
    else
      @errors = answer.errors.full_messages
      erb :'answers/new'
    end
  end
end

put '/questions/:question_id/answers/:answer_id' do

end
