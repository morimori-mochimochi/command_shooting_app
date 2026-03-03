class GameSession < ApplicationRecord
  belongs_to :user, optional: true

  def commands
    return Command.none if command_ids.blank?
    Command.where(id: command_ids).in_order_of(:id, command_ids)
  end
end
