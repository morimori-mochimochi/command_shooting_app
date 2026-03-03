class GameSession < ApplicationRecord
  belongs_to :user, optional: true

  def commands
    # command_idsが空の場合は、エラーを防ぐために空のActiveRecord::Relationを返す
    # Command.noneはAcitveRecordが提供する特別なオブジェクト
    # 結果が0の検索結果を返す
    # 「もしゲームで使うコマンドが一つもセットされてなかったら何もせずに、空の結果を返してください」の意味
    return Command.none if command_ids.blank?
    # 「command_ids配列に含まれるIDを持つCommandを、データベースからまとめて取得してください」という意味
    Command.where(id: command_ids).in_order_of(:id, command_ids)
  end
end
