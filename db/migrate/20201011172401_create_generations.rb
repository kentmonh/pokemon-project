class CreateGenerations < ActiveRecord::Migration[6.0]
  def change
    create_table :generations do |t|
      t.integer :number

      t.timestamps
    end
  end
end
