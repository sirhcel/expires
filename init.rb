Redmine::Plugin.register :foo do
  name 'Foo plugin'
  author 'Christian Meusel'
  description 'Simple plugin for expiring user accounts'
  version '0.0.1'
  # url 'http://example.com/path/to/plugin'
  # author_url 'http://example.com/about'
end


Rails.configuration.to_prepare do
  # Add expire date attribute.
  User.safe_attributes 'expires'

  # Pull hooks.
  require_dependency 'foo_hooks'

  # Pull and apply patch to the Redmine User class.
  require_dependency 'user'
  require_dependency 'foo_user_patch'
  User.send(:include, FooPlugin::Patches::UserPatch)
end
