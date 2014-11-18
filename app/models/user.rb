class User < ActiveRecord::Base
    has_many :posts
    has_many :comments, through: :posts
    validates :login, uniqueness: true

end