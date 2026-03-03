class AddCommandIdsToGameSessions < ActiveRecord::Migration[7.1]
  def change
    add_column :game_sessions, :command_ids, :text, :integer, array: true, default: []
  end
end
