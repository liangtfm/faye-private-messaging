class User < ActiveRecord::Base
	validates_uniqueness_of :username

	has_many :conversations, :foreign_key => :sender_id

	def self.generate_session_token
    SecureRandom::urlsafe_base64(16)
  end

  def reset_session_token!
    self.session_token = self.class.generate_session_token
    self.save!
    self.session_token
  end
end
