require 'spec_helper'

module Refinery
  module Entitlements
    describe Entitlement do
      describe "validations", type: :model do
        subject do
          FactoryGirl.create(:entitlement,
          :rank => "Refinery CMS")
        end

        it { should be_valid }
        its(:errors) { should be_empty }
        its(:rank) { should == "Refinery CMS" }
      end
    end
  end
end
