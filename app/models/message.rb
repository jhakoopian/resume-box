class Message < ActiveRecord::Base
  belongs_to :user
  belongs_to :resume

  after_create :send_resume_message_email

  default_scope { order(created_at: :desc) }

  validates :recipient, presence: true
  validates :subject, presence: true
  validates :body, presence: true
  validates_format_of :recipient,:with => Devise::email_regexp

  private
  def send_resume_message_email
    ResumeMessageMailer.resume_message_email(self.recipient, self.resume.user.email, self.subject, self.body, self.resume.document).deliver_now
  end
end
