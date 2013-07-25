require 'digest/md5'

class Lead < ActiveRecord::Base
	has_many :tokens
	before_save :default_values
	after_save :generate_token
  	def default_values
    	self.unsubscribe = Digest::MD5.hexdigest(DateTime.current.strftime("%Y-%m-%d %H:%M:%S %z") + self.email);

  	end

  	def generate_token
  		Token.generate_token_for_lead(self);
  	end
end
