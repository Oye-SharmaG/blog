class AddTagToArticles < ActiveRecord::Migration[7.0]
  def change
    add_column :articles, :tag, :text
  end
end
