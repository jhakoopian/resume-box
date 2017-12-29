class Resume < ActiveRecord::Base
  has_attached_file :document, styles: { :thumb => ["100x100#", :png] }
  validates_attachment :document, content_type: { content_type: "application/pdf" }
  belongs_to :user
end
