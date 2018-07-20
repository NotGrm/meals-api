class CreateMeals < ActiveRecord::Migration[5.2]
  def change
    create_table :meals do |t|
      t.date :eaten_on
      t.string :details
      t.string :meal_type

      t.timestamps
    end
  end
end
