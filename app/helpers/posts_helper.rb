# frozen_string_literal: true

module PostsHelper
  def choose_new_or_edit
    case action_name
    when 'index', 'new', 'create'
      confirm_posts_path
    when 'edit'
      post_path
    end
  end
end
