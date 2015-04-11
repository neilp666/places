class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  # validates the name 
  validates_presence_of :name

  # A user has many places 
  has_many :places, dependent: :destroy

  # A user has many reviews
   
  has_many :reviews, dependent: :destroy
end
