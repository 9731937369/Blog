class User < ActiveRecord::Base
	has_many :comments
	has_many :articles
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         validates_presence_of :username, :mobile, :gender, :age
         validates_uniqueness_of :username, :mobile
         validates_numericality_of :mobile, :age
         validates_length_of :mobile, is:10
end
