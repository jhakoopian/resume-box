class ShareResume < ApplicationMailer
  default from: 'donotreply@resumebox.com'

  def share_resume_email(recipient, subject, body)
    mail(to: "#{recipient}", subject: "#{subject}", body: "#{body}" )
  end
end
