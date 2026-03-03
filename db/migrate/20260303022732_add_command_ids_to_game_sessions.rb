class AddCommandIdsToGameSessions < ActiveRecord::Migration[7.1]
  def change
    add_column :game_sessions, :command_ids, :integer, array: true, default: []
  end
end
