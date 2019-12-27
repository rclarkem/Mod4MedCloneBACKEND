class RemoveImgFromStories < ActiveRecord::Migration[6.0]
  def change

    remove_column :stories, :img, :string
  end
end
