class DropGameSessionCommands < ActiveRecord::Migration[7.1]
  def change
    drop_table :game_session_commands, if_exists: true
  end
end
