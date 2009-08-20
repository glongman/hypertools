# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def render_top
    if logged_in?
      render :partial => 'home/logged_in_top'
    elsif User.count == 0
      render :partial => 'home/setup_top'
    elsif controller.controller_name == 'sessions' && %w(new create).include?(controller.action_name)
      render :partial => 'home/login_top'
    else
      render :partial => 'home/public_top'
    end
  end
  
end
