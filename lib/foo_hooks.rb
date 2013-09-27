module FooPlugin
  module Hooks
    class LayoutHook < Redmine::Hook::ViewListener
      render_on :view_users_form, :partial => 'expires'
    end
  end
end
