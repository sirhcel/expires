module ExpiresPlugin
  module Patches
    # Patch for the Redmine User class which implements expiring date checking
    # by means of active?.
    #
    # Hooking into active? easily prevents the AccountController from logging
    # in expired users and on the other hand results in an appropriate error
    # message. The latter one will be generated through
    # AccountController.password_authentication.
    module UserPatch
      def self.included(base)
        base.send :include, InstanceMethods

        base.class_eval do
          alias_method_chain :active?, :expire_date
        end
      end

      module InstanceMethods
        # Returns wheter this user account is expired.
        #
        # The user's time zone will be taken into account when checking the
        # expiring date. An account with no expiring date set will not expire.
        def expired?
          expired = false

          if expires
             expired = today > expires
          end

          return expired
        end

        # Wrapper around active? which takes the expiring date into account.
        def active_with_expire_date?
          return active_without_expire_date? && !expired?
        end
      end
    end
  end
end
