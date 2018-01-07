class ShareResume < ApplicationMailer
  def share_resume_email(from, to, subject, body, resume)
    mail(from: from, bcc: from, to: to, subject: subject, body: body )
  end
end
