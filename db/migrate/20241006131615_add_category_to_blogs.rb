class AddCategoryToBlogs < ActiveRecord::Migration[7.2]
  def change
    add_column :blogs, :category, :string
  end
end
