class ChangeUserIdNullOnGameSessions < ActiveRecord::Migration[7.1]
  def change
    change_column_null :game_sessions, :user_id, true
  end
end
