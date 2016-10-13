class Comment < ActiveRecord::Base
	belongs_to: :user
  belongs_to: :question
  belongs_to: :answer
  has_many: :votes
end
