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
      redirect_back_or_default('/')
      flash[:notice] = "Congratulations!"
    else
      flash[:error]  = "We couldn't set your account, sorry."
      render :action => 'new'
    end
  end
  
  protected
  
  def allow_only_one_user_create
    redirect_to unauthorized_sessions_path if User.count > 0 
  end
end
