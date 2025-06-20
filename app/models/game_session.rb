class GameSession < ApplicationRecord
  belongs_to :user

  has_many :game_session_commands
  has_many :commands, through: :game_session_commands

  has_one :score
end
