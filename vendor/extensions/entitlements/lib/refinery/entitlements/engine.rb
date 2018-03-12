module Refinery
  module Entitlements
    class Engine < Rails::Engine
      extend Refinery::Engine
      isolate_namespace Refinery::Entitlements

      engine_name :refinery_entitlements

      before_inclusion do
        Refinery::Plugin.register do |plugin|
          plugin.name = "entitlements"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.entitlements_admin_entitlements_path }
          plugin.pathname = root
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Entitlements)
      end
    end
  end
end
