class User < ApplicationRecord
  has_one :app, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
 
  :recoverable, :rememberable, :validatable
  def initialize(attributes = {})
    super
    self.role ||= "applicants"
  end 
end
