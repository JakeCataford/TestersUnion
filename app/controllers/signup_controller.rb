class SignupController < ApplicationController
  def index
  end

  def create
  	@lead = Lead.new(lead_params)

    respond_to do |format|
      if @lead.save
        format.html { render :text => "test success"}
      else
        format.html { render :text => "test failure"}
      end
    end
  end

   # Never trust parameters from the scary internet, only allow the white list through.
   def lead_params
    params.require(:lead).permit(:name, :email, :age, :sex)
   end
end
