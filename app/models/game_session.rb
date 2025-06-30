class GameSession < ApplicationRecord
  belongs_to :user, optional: true

  has_many :game_session_commands, dependent: :destroy
  has_many :commands, through: :game_session_commands
end
