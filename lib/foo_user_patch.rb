module FooPlugin
  module Patches
    module UserPatch
      def self.included(base)
        base.send :include, InstanceMethods
        base.extend ClassMethods

        base.class_eval do
          # class << self
          #   alias_method_chain :try_to_login, :expire_date
          # end

          alias_method_chain :active?, :expire_date
        end
      end

      module ClassMethods
        # def try_to_login_with_expire_date
        #   return nil
        # end
      end

      module InstanceMethods
        def active_with_expire_date?
          expired = false
          if self.expires
             expired = Date.today > self.expires
          end

          return active_without_expire_date? && !expired
        end
      end
    end
  end
end
