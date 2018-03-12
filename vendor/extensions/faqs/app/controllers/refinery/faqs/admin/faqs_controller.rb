module Refinery
  module Faqs
    module Admin
      class FaqsController < ::Refinery::AdminController

        crudify :'refinery/faqs/faq',
                :title_attribute => 'question', :xhr_paging => true,
                                          :order => "category DESC",
                                          :sortable => false

        private

        # Only allow a trusted parameter "white list" through.
        def faq_params
          params.require(:faq).permit(:id, :question, :answer, :category)
        end
      end
    end
  end
end
