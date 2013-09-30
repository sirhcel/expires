module ExpiresPlugin
  module Hooks
    class LayoutHook < Redmine::Hook::ViewListener
      # Delegate rendering the form elements to a partial.
      render_on :view_users_form, :partial => 'expires'
    end
  end
end
