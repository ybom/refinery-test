
FactoryGirl.define do
  factory :faq, :class => Refinery::Faqs::Faq do
    sequence(:category) { |n| "refinery#{n}" }
  end
end

