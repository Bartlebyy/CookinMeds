FactoryGirl.define do
  factory :recipe do
  	name "A New Recipe"
  	queued_for Time.now
  	serving_size 2
  end
end
