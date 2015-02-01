FactoryGirl.define do
  factory :recipe do
  	name "A New Recipe"
  	queued_for Time.now
  	serving_size 2

    ignore do
      steps_count 5
    end

    after :build do |recipe, evaluator|
      recipe.steps << FactoryGirl.build_list(:step, evaluator.steps_count, recipe: nil)
    end
  end
end
