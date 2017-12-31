class ApplicationMailer < ActionMailer::Base
  default from: "donotreply@resumebox.com"
  layout 'mailer'
end
