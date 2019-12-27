class AddImagesToStories < ActiveRecord::Migration[6.0]
  def change
    add_column :stories, :img, :string
  end
end
