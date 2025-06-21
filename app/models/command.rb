class Command < ApplicationRecord
  has_many :game_session_commands
  has_many :game_sessions, through: :game_session_commands
end
