class ConfirmMailer < ApplicationMailer
  def confirm_mail(picture)
    @picture = picture
    mail to: @picture.user.email, subject: "投稿が完了しました"
  end
end
