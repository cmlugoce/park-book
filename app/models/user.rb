class User < ApplicationRecord

  has_secure_password

    validates :username, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true
    validates :password, length: { minimum: 8, allow_nil: true },
    confirmation: true

    has_many :parks, :dependent => :destroy
    has_many :trails, through: :parks
    has_many:comments
   
   
end
