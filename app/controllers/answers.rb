get '/questions/:question_id/answers/new' do
  @question = Question.find_by(id: params[:question_id])
  @answer = Answer.new
  @action = "/questions/#{@question.id}/answers"
  @method = "Post"
  @event = "Submit Answer"

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

get '/questions/:question_id/answers/:answer_id/edit' do
  @question = Question.find(params[:question_id])
  @answer = Answer.find(params[:answer_id])
  @action = "/questions/#{@question.id}/answers/#{@answer.id}"
  @method = "Put"
  @event = "Edit Answer"

  if owner?(@answer.user)
    erb :'answers/edit'
  else
    redirect "/questions/#{@question.id}"
  end
end

put '/questions/:question_id/answers/:answer_id' do
  @answer = Answer.find(params[:answer_id])
  @answer.update_attributes(content: params[:content])
  if @answer.valid?
    redirect "/questions/#{@answer.question.id}"
  else
    @errors = @answers.errors.full_messages
    erb :'answers/edit'
  end
end
