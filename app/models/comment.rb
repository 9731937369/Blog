class Comment < ActiveRecord::Base
	belongs_to :article
	belongs_to :user
	#after_create :send_comment_to_author


	validates_presence_of :title, :description, :user_id, :article_id

	def send_comment_to_author
		Notification.comment_confirmation(self).deliver_now!
	end
end
