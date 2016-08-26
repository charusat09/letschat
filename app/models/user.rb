class User < ApplicationRecord
	has_secure_password

	has_many :chat_rooms, dependent: :destroy
end
