class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :body
      t.string :image_article
      t.string :image_header

      t.integer :status
      t.references :category, foreign_key: true
      t.integer :sort_order
      t.date :publish_date
      t.timestamps
    end
  end
end
