class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers, dependent: :destroy
  has_many :comments, { as: :commentable, dependent: :destroy }
  has_many :votes, { as: :voteable, dependent: :destroy }
  has_one :correct_answer

  validates :title, :content, presence: true
end
