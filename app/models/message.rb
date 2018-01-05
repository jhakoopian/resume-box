class Message < ActiveRecord::Base
  belongs_to :user
  belongs_to :resume

  after_create :send_message

  default_scope { order(created_at: :desc) }

  private
  def send_message
    ShareResume.share_resume_email.deliver_now(self.recipient, self.subject, self.body).deliver_now
  end
end
