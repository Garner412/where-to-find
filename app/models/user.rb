
class User < ActiveRecord::Base
  include BCrypt

  has_many :questions
  has_many :answers
  has_many :comments
  has_many :votes
  has_many :answered_questions, through: :questions, source: :answers
  has_many :commented_questions, through: :questions, source: :comments
  has_many :commented_answers, through: :answers, source: :comments
  has_many :voted_questions, through: :questions, source: :votes
  has_many :voted_answers, through: :answers, source: :votes
  has_many :voted_comments, through: :comments, source: :votes

  validates :username, :email, {presence: true, uniqueness: true}

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def authenticate(password)
    self.password == password
  end


end
