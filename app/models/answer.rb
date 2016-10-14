class Answer < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :user
  belongs_to :question
  has_many :comments, { as: :commentable, dependent: :destroy }
  has_many :votes, { as: :voteable, dependent: :destroy }

  validates :content, presence: true
end
