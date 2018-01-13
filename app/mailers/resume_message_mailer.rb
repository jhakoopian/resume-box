class ResumeMessageMailer < ApplicationMailer
  def resume_message_email(to, from, subject, body, resume)

    @body = body
    @resume = resume

    mail(to: to, from: from, subject: subject)
  end
end
