# frozen_string_literal: true

module Users
  class SessionsController < Devise::SessionsController
    def guest_sign_in
      user = if params[:admin]
               User.admin_guest
             else
               User.guest
             end
      sign_in user
      redirect_to posts_path, notice: 'ゲストユーザーとしてログインしました。'
    end
  end
end
