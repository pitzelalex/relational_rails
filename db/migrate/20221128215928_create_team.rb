class CreateTeam < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.string :name
      t.datetime :created_at
      t.datetime :updated_at
      t.boolean :champion
      t.integer :race_wins
    end
  end
end
