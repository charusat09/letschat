class User < ApplicationRecord
	has_secure_password

	has_many :chat_rooms, dependent: :destroy
	has_many :messages, dependent: :destroy

	def name
	  email.split('@')[0]
	end

end
