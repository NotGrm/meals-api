FactoryBot.define do
  factory :meal do
    eaten_on "2018-07-21"
    details "MyString"
    meal_type { Meal.meal_types.keys.sample }
  end
end
