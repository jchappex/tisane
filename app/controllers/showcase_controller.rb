class ShowcaseController < ApplicationController
  skip_before_action :authorize
  skip_before_action :admin_only
  def Home
      render :layout => "home"
  end
  def Video
    render :layout => false
  end
  def Idea
    @check = true
  end
  def Legend
    @check = true
  end
end
