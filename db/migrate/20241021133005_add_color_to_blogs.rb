class AddColorToBlogs < ActiveRecord::Migration[7.2]
  def change
    add_column :blogs, :color, :string
  end
end
