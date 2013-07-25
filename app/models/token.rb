require 'digest/md5'

class Token < ActiveRecord::Base
	belongs_to :lead

	def self.generate_new_token_set!
		Lead.all.each do |l|
			t = Token.create
			t.lead = l;
			t.value = Digest::MD5.hexdigest(DateTime.current.strftime("%Y-%m-%d %H:%M:%S %z") + l.email + l.unsubscribe);
			t.save!
		end 
	end

	def self.generate_token_for_lead(lead)
		t = Token.create
		t.lead = lead
		t.value = Digest::MD5.hexdigest(DateTime.current.strftime("%Y-%m-%d %H:%M:%S %z") + lead.email + lead.unsubscribe);
		t.save!
	end

end
