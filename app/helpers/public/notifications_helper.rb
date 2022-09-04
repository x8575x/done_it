module Public::NotificationsHelper

  def notification_form(notification)
	  @visiter = notification.visiter
	  @comment = nil
	 # your_item = link_to 'あなたの投稿', users_review_path(notification), style:"font-weight: bold;"
	  @visiter_comment = notification.comment_id
	  #notification.actionがfollowかlikeかcommentか
	  case notification.action
	    when "follow" then
	      tag.a(notification.visiter.name, href:user_path(@visiter), style:"font-weight: bold;")+"があなたをフォローしました"
	    when "favorite" then
	      tag.a(notification.visiter.name, href:user_path(@visiter), style:"font-weight: bold;")+"が"+tag.a('あなたの投稿', href:review_path(notification.review_id), style:"font-weight: bold;")+"にいいねしました"
	    when "comment" then
	    	@comment = Comment.find_by(id: @visiter_comment)&.comment
	    	tag.a(@visiter.name, href:user_path(@visiter), style:"font-weight: bold;")+"が"+tag.a('あなたの投稿', href:review_path(notification.review_id), style:"font-weight: bold;")+"にコメントしました"
	    when "dm" then
	    	tag.a(notification.visiter.name, href:user_path(@visiter))+"さんから"+tag.a('メッセージ', href:direct_message_path(@visiter))+"が届いています"
	  end
  end

end
