# frozen_string_literal: true

class CommentMailer < ApplicationMailer
  def comment_mail(email)
    mail to: email, subject: 'コメント通知メール'
  end
end
