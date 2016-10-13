get '/answers/:answer_id/comments/new' do
  @answer = Answer.find_by(id: params[:answer_id])
  @question = Question.find_by(id: @answer.question.id)
  if logged_in?
    erb :'comments/answer/new'
  else
    redirect "/questions/#{@question.id}"
  end
end

get '/questions/:question_id/comments/new' do
  @question = Question.find_by(id: params[:question_id])
  if logged_in?
    erb :'comments/question/new'
  else
    redirect "/questions/#{@question.id}"
  end
end

post '/questions/:question_id/comments' do
  @question = Question.find_by(id: params[:question_id])
  if logged_in?
    comment = Comment.new(content: params[:content], user_id: current_user.id, commentable_id: @question.id, commentable_type: "Question")
    if comment.save
      redirect "/questions/#{@question.id}"
    else
      @errors = comment.errors.full_messages
      erb :'comments/question/new'
    end
  end
end


post '/answers/:answer_id/comments' do
  @answer = Answer.find_by(id: params[:answer_id])
  @question = @answer.question
  if logged_in?
    comment = Comment.new(content: params[:content], user_id: current_user.id, commentable_id: @answer.id, commentable_type: "Answer")
    if comment.save
      redirect "/questions/#{@question.id}"
    else
      @errors = comment.errors.full_messages
      erb :'comments/answer/new'
    end
  end
end

