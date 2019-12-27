class CreateStories < ActiveRecord::Migration[6.0]
  def change
    create_table :stories do |t|
      t.string :title
      t.string :body
      t.integer :author_id

      t.timestamps
    end
  end
end
