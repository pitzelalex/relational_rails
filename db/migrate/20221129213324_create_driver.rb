class CreateDriver < ActiveRecord::Migration[5.2]
  def change
    create_table :drivers do |t|
      t.string :name
      t.datetime :created_at
      t.datetime :updated_at
      t.boolean :superlicense
      t.string :previous_series
      t.integer :race_wins_in_series
    end
  end
end
