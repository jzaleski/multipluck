class CreateWidgets < ActiveRecord::Migration
  def change
    create_table :widgets do |t|
      t.string :a_string
      t.integer :an_int
      t.decimal :a_decimal
      t.boolean :a_bool
      t.datetime :a_datetime

      t.timestamps
    end
  end
end
