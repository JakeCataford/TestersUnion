class LeadMailer < ActionMailer::Base
  default from: "do-not-reply@Studio236.ca"


  def welcome_mail(lead)
  	@lead = lead
  	@time = Time.now
  	mail(to: lead.email, subject: "Welcome To Testers Union!")
  end

end
