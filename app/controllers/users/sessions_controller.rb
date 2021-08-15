class Users::SessionsController < Devise::SessionsController
  def guest_sign_in
    if params[:admin]
      user = User.admin_guest
    else
      user = User.guest
    end
    sign_in user
    redirect_to posts_path, notice: 'ゲストユーザーとしてログインしました。'
  end
end
