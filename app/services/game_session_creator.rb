class GameSessionCreator
  def initialize(user: nil)
    @user = user
  end

  def call
    game_session = create_game_session
    setup_commands(game_session)
    game_session
  end

  private

  def create_game_session
    @user ? @user.game_sessions.create! : GameSession.create!
  end

  def setup_commands(game_session)
    # Comandsからランダムに５つ選択してGamesessionsに結びつける
    # DB側でランダムに5件取得することで、全IDをメモリにロードするのを防ぎ、パフォーマンスを向上させます。
    command_ids = Command.order("RANDOM()").limit(5).pluck(:id)
    game_session.update!(command_ids: command_ids)
  end
end