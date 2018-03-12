require 'spec_helper'

module Refinery
  module Faqs
    describe Faq do
      describe "validations", type: :model do
        subject do
          FactoryGirl.create(:faq,
          :category => "Refinery CMS")
        end

        it { should be_valid }
        its(:errors) { should be_empty }
        its(:category) { should == "Refinery CMS" }
      end
    end
  end
end
