class Resume < ActiveRecord::Base
  has_attached_file :document

  belongs_to :user
  has_many :messages

  validates_attachment :document, content_type: { content_type: "application/pdf" }

end
