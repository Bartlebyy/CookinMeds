FactoryGirl.define do
  factory :step do
    sequence(:text) { |n| "Step #{n}: Do something!" }
    sequence(:position)

    recipe
  end
end
