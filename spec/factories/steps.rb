FactoryGirl.define do
  factory :step do
    sequence(:text) { |n| "Step #{n}: Do something!" }

    recipe
  end
end
