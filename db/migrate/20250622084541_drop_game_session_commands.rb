class DropGameSessionCommands < ActiveRecord::Migration[7.1]
  def change
    drop_table :game_session_commands
  end
end
