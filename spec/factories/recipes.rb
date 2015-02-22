FactoryGirl.define do
  factory :recipe do
    name "A New Recipe"
    queued_for Time.now
    serving_size 2

    trait :with_steps do
      ignore { steps_count 5 }

      after(:build) do |recipe, evaluator|
        recipe.steps << build_list(:step, evaluator.steps_count, recipe: recipe)
      end
    end

    trait :with_ingredients do
      ignore { ingredients_count 3 }

      after(:build) do |recipe, evaluator|
        recipe.ingredients << build_list(:ingredient, evaluator.ingredients_count, recipe: recipe)
      end
    end
  end
end
