class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessor :registration_code
  attr_accessible :email, :password, :password_confirmation, :remember_me, :registration_code
  # attr_accessible :title, :body
  
  validates_each :registration_code, :on => :create do |record, attr, value|
    record.errors.add attr, "Please enter correct registration code" unless value && value == "defaultvalue"
  end

end
