class ShareResumeMailer < ApplicationMailer
  default from: "donotreply@resumebox.com"

  def send_test_email
    mail(to: "joseph.hakoopian@gmail.com", subject: "From Resume Box")
  end
end
