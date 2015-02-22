FactoryGirl.define do
  factory :ingredient do
    sequence(:name) { |n| "Ingredient ##{n}" }
    measurement 2
    unit 'handfull'
    recipe
  end
end