# Preview all emails at http://localhost:3000/rails/mailers/notification
class NotificationPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/notification/comment_confirmation
  def comment_confirmation
    Notification.comment_confirmation
  end

end
