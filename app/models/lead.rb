require 'digest/md5'

class Lead < ActiveRecord::Base
	has_many :tokens
	before_save :default_values
  	def default_values
    	self.unsubscribe = Digest::MD5.hexdigest(DateTime.current.strftime("%Y-%m-%d %H:%M:%S %z") + self.email);
  	end
end
