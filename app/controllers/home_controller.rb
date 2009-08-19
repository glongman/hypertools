class HomeController < ApplicationController
  skip_before_filter :login_required, :only => [:index]
  def index
    if User.count == 0
      redirect_to get_started_path
    elsif logged_in?
      redirect_to home_path
    end
  end
end
