class AddDeadlineToBlogs < ActiveRecord::Migration[7.2]
  def change
    add_column :blogs, :deadline, :datetime
  end
end
