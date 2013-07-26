class DashboardController < ApplicationController
  include GoogleAuth::Controller
  
  def index
  	@leads = Lead.all
    @releases = Release.all
    @tokens = Token.all
    @averageAge = @leads.collect(&:age).sum.to_f/@leads.length if @leads.length > 0
    @recentleads = Lead.all(:conditions => ["created_at >= ?", Time.zone.now.beginning_of_month])
    @percentGrowth = (@leads.count/@recentleads.count) * 100
  end

  def generate_new_tokens
  	Token.generate_new_token_set!
  	#redirect_to action: 'index', status: 201
  end
end
