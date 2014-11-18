class Post < ActiveRecord::Base
    belongs_to :user
    has_many :comments
    after_create :put_message, if: :one_of_the_first
    validates :title, length: {minimum: 2, maximum: 20}
    validates :title, presence: true

    private
    def put_message
        puts "post created"
    end

    def one_of_the_first
        false
    end
end