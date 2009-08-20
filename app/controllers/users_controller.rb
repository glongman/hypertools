class UsersController < ApplicationController
    
  prepend_before_filter :allow_only_one_user_create, :only => [:new, :create]
  skip_before_filter :login_required, :only => [:new, :create]
  
  # render new.rhtml
  def new
    @user = User.new
  end
 
  def create
    logout_keeping_session!
    @user = User.new(params[:user])
    success = @user && @user.save
    if success && @user.errors.empty?
      self.current_user = @user # !! now logged in
      flash[:notice] = "Congratulations! You now have a feed!"
      redirect_back_or_default('/home')
    else
      flash.now[:error]  = "We couldn't set your account. Fix the errors below and submit the form again."
      render :action => 'new'
    end
  end
  
  protected
  
  def allow_only_one_user_create
    if User.count > 0 
      flash[:error] = "This feed is already setup for #{User.first.name}." 
      redirect_to public_home_path
    end
  end
end
