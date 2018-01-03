class Notification < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notification.comment_confirmation.subject
  #
  def comment_confirmation(comment)
    @comment = comment

     mail to: "#{comment.article.user.email}", subject: "Your article(#{comment.article.title}) got a new comment "
  end
end
