get '/questions/:question_id/answers/new' do
  @question = Question.find_by(id: params[:question_id])
  erb :'answers/new'
end

post '/questions/:question_id/answers' do
  if logged_in?
end

put '/questions/:question_id/answers/:answer_id' do

end
