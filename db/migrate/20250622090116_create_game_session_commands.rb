class CreateGameSessionCommands < ActiveRecord::Migration[7.1]
  def change
    create_table :game_session_commands do |t|
      t.references :command, null: false, foreign_key: true
      t.references :game_session

      t.timestamps
    end
  end
end
