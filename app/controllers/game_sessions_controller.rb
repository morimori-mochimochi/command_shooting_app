class GameSessionsController < ApplicationController
  before_action :set_game_session, only: [:show, :finish, :result]
  def new
    @game_session = 
    if user_signed_in?
      current_user.game_sessions.create!
    else
      GameSession.create!
    end

    #Commandからランダムに５つ選び、Gamesessionに結びつける
    commands = Command.order('RAND()').limit(5)
    commands.each do |command|
      @game_session.game_session_commands.create!(command: command)
    end
    redirect_to game_session_path(@game_session)
  end

  def show
    @commands = @game_session.commands
  end

  def finish
    @game_session.update(duration: params[:duration])
    redirect_to result_game_session_path(@game_session)
  end

  def result; end

  private

  def set_game_session
    @game_session = GameSession.find(params[:id])
  end
end
