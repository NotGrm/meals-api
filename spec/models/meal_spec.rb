require 'rails_helper'

RSpec.describe Meal, type: :model do
  it do
    is_expected.to define_enum_for(:meal_type)
      .with_values(
        breakfast: 'breakfast',
        morning_snack: 'morning_snack',
        lunch: 'lunch',
        afternoon_snack: 'afternoon_snack',
        dinner: 'dinner'
      ).backed_by_column_of_type(:string)
  end

  it { is_expected.to validate_presence_of(:eaten_on) }
  it { is_expected.to validate_presence_of(:details) }
  it { is_expected.to validate_presence_of(:meal_type) }
end
