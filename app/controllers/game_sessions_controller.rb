class GameSessionsController < ApplicationController
  before_action :set_game_session, only: [:show, :finish, :finished, :result]
  def create
    @game_session = 
    if user_signed_in?
      current_user.game_sessions.create!
    else
      GameSession.create!
    end

    #Commandからランダムに５つ選び、Gamesessionに結びつける
    command_ids = Command.pluck(:id).sample(5)
    @game_session.update!(command_ids: command_ids)

    redirect_to game_session_path(@game_session)
  end

  def show
    @commands = @game_session.commands
    @current_index = (params[:index] || 0).to_i
    @command = @commands[@current_index]
  end

  def finish
    puts "[DEBUG] PARAMS: #{params.inspect}"
    @game_session.update(duration: params[:duration])
  end

  def finished; end

  def result; end

  private

  def set_game_session
    @game_session = GameSession.find(params[:id])
  end
end
