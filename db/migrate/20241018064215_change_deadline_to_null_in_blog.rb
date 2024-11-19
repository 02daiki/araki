class ChangeDeadlineToNullInBlog < ActiveRecord::Migration[7.2]
  def change
    change_column_null :blogs, :deadline, true
  end
end
