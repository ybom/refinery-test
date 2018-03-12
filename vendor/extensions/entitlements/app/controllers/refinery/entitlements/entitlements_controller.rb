module Refinery
  module Entitlements
    class EntitlementsController < ::ApplicationController

      before_action :find_all_entitlements
      before_action :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @entitlement in the line below:
        present(@page)
      end

      def show
        @entitlement = Entitlement.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @entitlement in the line below:
        present(@page)
      end

    protected

      def find_all_entitlements
        @entitlements = Entitlement.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/entitlements").first
      end

    end
  end
end
