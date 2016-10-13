
User.create(username: 'user1', email: 'user1@gmail.com', password: 'password')
User.create(username: 'user2', email: 'user2@gmail.com', password: 'password')
User.create(username: 'user3', email: 'user3@gmail.com', password: 'password')
User.create(username: 'user4', email: 'user4@gmail.com', password: 'password')
User.create(username: 'user5', email: 'user5@gmail.com', password: 'password')

Question.create(title: "Question1", content: "content of question 1", user_id: rand(1..5))
Question.create(title: "Question2", content: "content of question 2", user_id: rand(1..5))
Question.create(title: "Question3", content: "content of question 3", user_id: rand(1..5))
Question.create(title: "Question4", content: "content of question 4", user_id: rand(1..5))
Question.create(title: "Question5", content: "content of question 5", user_id: rand(1..5))
Question.create(title: "Question6", content: "content of question 6", user_id: rand(1..5))
Question.create(title: "Question7", content: "content of question 7", user_id: rand(1..5))
Question.create(title: "Question8", content: "content of question 8", user_id: rand(1..5))
Question.create(title: "Question9", content: "content of question 9", user_id: rand(1..5))
Question.create(title: "Question10", content: "content of question 10", user_id: rand(1..5))
Question.create(title: "Question11", content: "content of question 11", user_id: rand(1..5))
Question.create(title: "Question12", content: "content of question 12", user_id: rand(1..5))
Question.create(title: "Question13", content: "content of question 13", user_id: rand(1..5))
Question.create(title: "Question14", content: "content of question 14", user_id: rand(1..5))
Question.create(title: "Question15", content: "content of question 15", user_id: rand(1..5))


15.times { Answer.create(content: "content of this answer and stuff", user_id: rand(1..5), question_id: rand(1..15)) }

comm_types = ['Question', 'Answer']

100.times { Comment.create(content: "this is a comment, I can be errwhere", user_id: rand(1..5), commentable_type: comm_types.sample, commentable_id: rand(1..15)) }

vote_types = ['Question', 'Answer', 'Comment']

100.times { Vote.create(voteable_id: rand(1..15), voteable_type: vote_types.sample, user_id: rand(1..5))  }

