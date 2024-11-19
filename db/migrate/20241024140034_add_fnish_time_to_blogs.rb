class AddFnishTimeToBlogs < ActiveRecord::Migration[7.2]
  def change
    add_column :blogs, :finish_time, :datetime
  end
end
