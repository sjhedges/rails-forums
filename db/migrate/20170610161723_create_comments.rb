class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.text :text, null: false
      t.string :author, null: false
      t.belongs_to :post, foreign_key: true

      t.timestamps
    end
  end
end
