class GameSessionsController < ApplicationController
  def new
    @game_session = current_user.game_sessions.create!

    #Commandからランダムに５つ選び、Gamesessionに結びつける
    commands = Command.order('RAND()').limit(5)
    commands each do |command|
      @game_session.game_session_commands.create!(command: command)
    end
    redirect_to game_session_path(@game_session)
  end
end
