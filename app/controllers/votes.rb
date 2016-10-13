post '/questions/:id/votes' do
  @question = Question.find(params[:id])
  @user = current_user
  @vote = @question.votes.create(user_id: @user.id)
  redirect "/questions/#{@question.id}"
end


post '/answers/:id/votes' do
  @answer = Answer.find(params[:id])
  @user = current_user
  @vote = @answer.votes.create(user_id: @user.id)
  @question = @answer.question
  redirect "/questions/#{@question.id}"
end



post '/comments/:id/votes' do
  @comment = Comment.find(params[:id])
  @user = current_user
  @vote = @comment.votes.create(user_id: @user.id)
  if @comment.commentable_type == "Question"
    @question = @comment.commentable
  else
    @question = @comment.commentable.question
  end
  redirect "/questions/#{@question.id}"
end
