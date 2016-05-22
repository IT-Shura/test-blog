class RegistrationsController < Devise::RegistrationsController
  def new
    super
  end

  def create
    @user = User.new sign_up_params
    if @user.save
      current_user.move_to(@user) if current_user && current_user.has_role?(:visitor)
      @user.add_role :registered_user
      sign_up("user", @user)
      redirect_to user_profile_path
    else
      render :new
    end
  end
  
end