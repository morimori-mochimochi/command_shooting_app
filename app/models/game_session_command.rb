class GameSessionCommand < ApplicationRecord
  belongs_to :game_session
  belongs_to :command
end
