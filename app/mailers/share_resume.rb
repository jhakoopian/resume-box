class ShareResume < ApplicationMailer
  def share_resume_email(from, to, subject, body, resume)
    mail(from: "#{message.user.email}", bcc: "#{message.user.email}", to: "#{recipient}", subject: "#{subject}", body: "#{body}" )
  end
end
