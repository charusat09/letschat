class JsonWebToken 
	class << self 
		def encode(payload, exp = 24.hours.from_now) 
			payload[:exp] = exp.to_i 
			JWT.encode(payload, Rails.application.secrets.secret_key_base) 
		end 
		def decode(token) 
			body = JWT.decode(token, Rails.application.secrets.secret_key_base)[0] 
			HashWithIndifferentAccess.new body 
		rescue 
			nil 
		end 
	end 
end

# Read more at http://tutorials.pluralsight.com/ruby-ruby-on-rails/token-based-authentication-with-ruby-on-rails-5-api#wZOCToBQ6QpfZKuY.99