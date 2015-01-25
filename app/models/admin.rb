class Admin < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,  :rememberable, :trackable, :validatable # :registerable, :recoverable


  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :mobile, :fax, :nume, :prenume, :image
  # attr_accessible :title, :body
  scope :all_ordered, order("email ASC")

end
