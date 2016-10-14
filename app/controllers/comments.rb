get '/answers/:answer_id/comments/new' do
  @answer = Answer.find_by(id: params[:answer_id])
  @question = Question.find_by(id: @answer.question.id)
  @action = "/answers/#{@answer.id}/comments"
  @method = "Post"
  @event = "Add Comment"
  @comment = Comment.new
  if logged_in?
    erb :'comments/answer/new'
  else
    redirect "/questions/#{@question.id}"
  end
end

get '/questions/:question_id/comments/new' do
  @question = Question.find_by(id: params[:question_id])
  @action = "/questions/#{@question.id}/comments"
  @method = "Post"
  @event = "Add Comment"
  @comment = Comment.new
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

get '/questions/:question_id/comments/:comment_id/edit' do
  @comment = Comment.find(params[:comment_id])
  @question = @comment.commentable
  @action = "/questions/#{@comment.commentable_id}/comments/#{@comment.id}"
  @method = "Put"
  @event = "Edit Comment"

  if owner?(@comment.user)
    erb :'comments/question/edit'
  else
    redirect "/questions/#{@question.id}"
  end
end

put '/questions/:question_id/comments/:comment_id' do
  @comment = Comment.find(params[:comment_id])
  @question = @comment.commentable
  @comment.update_attributes(content: params[:content])
  if @comment.valid?
    redirect "/questions/#{@comment.commentable.id}"
  else
    @errors = @comment.errors.full_messages
    @action = "/questions/#{@comment.commentable_id}/comments/#{@comment.id}"
    @method = "Put"
    @event = "Edit Comment"
    erb :'comments/question/edit'
  end

end

get '/answers/:answer_id/comments/:comment_id/edit' do
  @comment = Comment.find(params[:comment_id])
  @answer = @comment.commentable
  @question = @answer.question
  @action = "/answers/#{@comment.commentable.id}/comments/#{@comment.id}"
  @method = "Put"
  @event = "Add Comment"

  if owner?(@comment.user)
    erb :'comments/answer/edit'
  else
    redirect "/questions/#{@question.id}"
  end
end

put '/answers/:answer_id/comments/:comment_id' do
  @comment = Comment.find(params[:comment_id])
  @comment.update_attributes(content: params[:content])
  @answer = @comment.commentable
  @question = @answer.question
  if @comment.valid?
    redirect "/questions/#{@comment.commentable.question.id}"
  else
    @errors = @comment.errors.full_messages
    @action = "/answers/#{@comment.commentable.id}/comments/#{@comment.id}"
  @method = "Put"
  @event = "Add Comment"
    erb :'comments/answer/edit'
  end
end

