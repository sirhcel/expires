Redmine::Plugin.register :expires do
  name 'Expires'
  author 'Christian Meusel'
  description 'Simple plugin for expiring user accounts'
  version 'development'
  # url 'http://example.com/path/to/plugin'
  # author_url 'http://example.com/about'
end


Rails.configuration.to_prepare do
  # Add expire date attribute.
  User.safe_attributes 'expires'

  # Pull hooks.
  require_dependency 'expires_hooks'

  # Pull and apply patch to the Redmine User class.
  require_dependency 'user'
  require_dependency 'expires_user_patch'
  User.send(:include, ExpiresPlugin::Patches::UserPatch)
end
