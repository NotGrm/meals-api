class Meal < ApplicationRecord
  enum meal_type: {
    breakfast: 'breakfast',
    morning_snack: 'morning_snack',
    lunch: 'lunch',
    afternoon_snack: 'afternoon_snack',
    dinner: 'dinner'
  }

  validates :eaten_on, presence: true
  validates :meal_type, presence: true
  validates :details, presence: true
end
