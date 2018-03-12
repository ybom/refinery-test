module Refinery
  module Entitlements
    module Admin
      class EntitlementsController < ::Refinery::AdminController

        crudify :'refinery/entitlements/entitlement',
                :title_attribute => 'rank'

        private

        # Only allow a trusted parameter "white list" through.
        def entitlement_params
          params.require(:entitlement).permit(:rank, :total_weight_self, :total_weight_self_plus_dependents, :pro_gear_weight, :pro_gear_weight_spouse, :slug)
        end
      end
    end
  end
end
