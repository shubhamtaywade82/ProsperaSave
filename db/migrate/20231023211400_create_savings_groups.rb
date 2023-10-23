class CreateSavingsGroups < ActiveRecord::Migration[7.1]
  def change
    create_table :savings_groups, id: :uuid do |t|
      t.string :name
      t.string :start_date
      t.integer :duration

      t.timestamps
    end
    add_index :savings_groups, :name, unique: true
    add_index :savings_groups, :start_date, unique: true
  end
end
