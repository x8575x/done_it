module Public::DmRoomsHelper
  # 最新メッセージのデータを取得して表示するメソッド
  def most_new_message_preview(entry)
    # 最新メッセージのデータを取得する
    message = entry.dm_room.direct_messages.message.order(updated_at: :desc).limit(1)
    # 配列から取り出す
    message = message[0]
    # メッセージの有無を判定
    if message.present?
      # メッセージがあれば内容を表示
      tag.p " #{message} "
    else
      # メッセージがなければ[ まだメッセージはありません ]を表示
      tag.p "[ まだメッセージはありません ]"
    end
  end
end
