class Resume < ActiveRecord::Base
  has_attached_file :document
  validates_attachment :document, content_type: { content_type: "application/pdf" }
  belongs_to :user
  has_many :messages
end
