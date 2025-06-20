class CreateGameSessionCommands < ActiveRecord::Migration[7.1]
  def change
    create_table :game_session_commands do |t|
      t.string :value
      t.references :game_session, null: false, foreign_key: true
      t.references :commands, null: false, foreign_key: true

      t.timestamps
    end
  end
end
