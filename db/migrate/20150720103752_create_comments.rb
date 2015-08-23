class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.belongs_to :post, index: true
      t.string :title
      t.text :content
      t.timestamps
    end
  end
end