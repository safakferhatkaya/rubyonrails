class CreateHolidays < ActiveRecord::Migration[6.1]
  def change
    create_table :holidays do |t|
      t.string :holiday_name
      t.string :date
      t.string :country

      t.timestamps
    end
  end
end
