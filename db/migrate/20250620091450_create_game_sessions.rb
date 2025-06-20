class CreateGameSessions < ActiveRecord::Migration[7.1]
  def change
    create_table :game_sessions do |t|
      t.integer :value
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
