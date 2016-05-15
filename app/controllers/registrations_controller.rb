class RegistrationsController < Devise::RegistrationsController
  def new
    super
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      current_user.move_to(@user) if current_user && current_user.has_role? :guest
      sign_up("user", @user)
      @user.add_role :user
      redirect_to user_root_path
    else
      render :new
    end
  end
end
