class User < ActiveRecord::Base
	validates_uniqueness_of :username

	has_many :conversations, :foreign_key => :sender_id
end
