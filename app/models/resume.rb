class Resume < ActiveRecord::Base
  has_attached_file :document

  belongs_to :user
  has_many :messages

  validates :name, presence: true
  validates_attachment :document,
    presence: true,
    content_type: { content_type: ["application/pdf",
                                  "application/msword",
                                  "application/vnd.openxmlformats-officedocument.wordprocessingml.document"] },
    size: { in: 0..1000.kilobytes }

  after_validation :cleanup_paperclip_duplicate_errors

  def cleanup_paperclip_duplicate_errors
    errors.delete(:document)
  end
end
