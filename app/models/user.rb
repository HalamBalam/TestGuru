class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
        :registerable,
        :recoverable,
        :rememberable,
        :confirmable,
        :trackable,
        :validatable

  has_many :created_tests, class_name: 'Test'
  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :gists
  has_many :user_badges
  has_many :badges, through: :user_badges

  validates :email, uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i }
  
  def passed_tests(level)
    tests.where(level: level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

  def admin?
    self.is_a?(Admin)
  end

  def name
    first_name.nil? ? email : first_name
  end

end
