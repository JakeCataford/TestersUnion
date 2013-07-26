class ReleasesController < ApplicationController
  def create
    @release = Release.new(release_params)
    respond_to do |format|
      if @release.save
        format.html { render :text => "good"}
      else 
        format.html { render :text => "bad"}
      end
    end
  end

  def release_params
    params.require(:release).permit(:title, :url)
  end
end
