class CreateBanners < ActiveRecord::Migration[5.2]
  def change
    create_table :banners do |t|
      t.string :title
      t.string :image_banner
      t.string :image_alt
      t.boolean :use_url
      t.string :url

      t.references :category, foreign_key: true
      t.references :article, foreign_key: true
      t.integer :sort_order
      t.integer :status
      
      t.timestamps
    end
  end
end
