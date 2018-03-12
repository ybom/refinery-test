
FactoryGirl.define do
  factory :entitlement, :class => Refinery::Entitlements::Entitlement do
    sequence(:rank) { |n| "refinery#{n}" }
  end
end

