class AuthenticationController < ApplicationController 
	skip_before_action :authenticate_request 

	def authenticate 
		command = AuthenticateUser.call(params[:email], params[:password]) 

		if command.success? 
			render json: { auth_token: command.result } 
		else 
			render json: { error: command.errors }, status: :unauthorized 
		end 
	end 
end

# Read more at http://tutorials.pluralsight.com/ruby-ruby-on-rails/token-based-authentication-with-ruby-on-rails-5-api#wZOCToBQ6QpfZKuY.99