FactoryGirl.define do
  factory :recipe do
    name "A New Recipe"
    queued_for Time.now
    serving_size 2

    factory :recipe_with_steps do
      ignore { steps_count 5 }

      after(:build) do |recipe, evaluator|
        recipe.steps << build_list(:step, evaluator.steps_count, recipe: recipe)
      end
    end
  end
end
