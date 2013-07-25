require 'digest/md5'

class SignupController < ApplicationController
	def index
	end

	def create
		@lead = Lead.new(lead_params)

		respond_to do |format|
			if @lead.save
				LeadMailer.welcome_mail(@lead).deliver
				format.html { render :text => "<div class='alert alert-success span4'><strong>Success! </strong>You&apos;re in our system at <strong>" + @lead.email + "</strong>, check your email for confirmation.</div>"}
			else
				format.html { render :text => "<div class='alert alert-error span4'><strong>Oops!</strong>You&apos;re already in our system. Remember to check your spam folder for that email.</div>"}
			end
		end
	end

  # Never trust parameters from the scary internet, only allow the white list through.
  def lead_params
   	params.require(:lead).permit(:name, :email, :age, :sex)
  end

  def unsub_params
   	params.require(:unsubscribe)
  end

  def token_params
   	params.require(:token)
  end

  def destroy
   	@lead = Lead.find_by_unsubscribe(unsub_params)
   	respond_to do |format|
   		unless @lead.nil?
   			@lead.destroy
   			format.html { render :text => "Unsubscribed"}
   		else
   			format.html { render :text => "User Not Found. You probably are already unsubscribed."}
   		end
   	end
  end

  def respond

   	@token = Token.find_by_value(token_params)
   	begin
   		@lead = Lead.find(@token.lead)
   	rescue
   		@lead = nil
   	end
   	respond_to do |format|
   		unless @lead.nil?
   			format.html { render :text => "#{@lead.name}|#{@lead.sex}|#{@lead.age}|#{('a'..'z').to_a.shuffle[0,8].join}" }
   		else 
   			format.html { render :text => "NOT_FOUND" }
   		end
   	end
  end
end
