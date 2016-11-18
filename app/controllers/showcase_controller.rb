class ShowcaseController < ApplicationController
  skip_before_action :authorize
  skip_before_action :admin_only
  def Home
      render :layout => "home"
  end
  def Video
    render :layout => false
  def Idea
  end
  def Legend
  end
end
end
