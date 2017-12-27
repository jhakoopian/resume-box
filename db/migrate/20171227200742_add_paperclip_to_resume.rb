class AddPaperclipToResume < ActiveRecord::Migration
  def change
    add_attachment :resumes, :image
  end
end
