class Command < ApplicationRecord
  has_many :game_session_commands
  has_many :game_ssession through: :game_session_commands
end
