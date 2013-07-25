class DashboardController < ApplicationController

  def index
  	@leads = Lead.all;
  end

  def generate_new_tokens
  	Token.generate_new_token_set!
  	#redirect_to action: 'index', status: 201
  end
end
