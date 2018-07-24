class MealSerializer
  include FastJsonapi::ObjectSerializer

  set_type :meals

  attributes :eaten_on, :meal_type, :details
end
