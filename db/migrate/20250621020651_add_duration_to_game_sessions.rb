class AddDurationToGameSessions < ActiveRecord::Migration[7.1]
  def change
    add_column :game_sessions, :duration, :float
  end
end
