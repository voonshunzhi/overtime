class User < ApplicationRecord
  validates_presence_of :first_name,:last_name
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  def full_name
    [first_name,last_name].join(' ')
  end
end
