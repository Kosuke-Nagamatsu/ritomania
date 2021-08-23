class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!, if: :use_auth?

  def after_sign_in_path_for(resource)
    if controller_name == 'sessions'
      posts_path(resource)
    else
      user_path(resource)
    end
  end
  def after_update_path_for(resource)
    user_path(resource)
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :icon, { island_ids: [] }])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :icon, { island_ids: [] }])
  end
  private
  def use_auth?
    unless controller_name == 'tops' && action_name == 'index'
      true
    end
  end
end
