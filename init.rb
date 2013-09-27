puts "Greetings from plugin Foo!"


Redmine::Plugin.register :foo do
  puts "Redmine::Plugin.register"

  name 'Foo plugin'
  author 'Author name'
  description 'This is a plugin for Redmine'
  version '0.0.1'
  url 'http://example.com/path/to/plugin'
  author_url 'http://example.com/about'
end


Rails.configuration.to_prepare do
  puts "Rails.configuration.to_prepare"

  # User::SAFE_ATTRIBUTES << "expires"
  User.safe_attributes 'expires'

  require_dependency 'user'
  require_dependency 'foo_hooks'
  require_dependency 'foo_user_patch'

  User.send(:include, FooPlugin::Patches::UserPatch)
end
