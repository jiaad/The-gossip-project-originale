class CreateGossips < ActiveRecord::Migration[5.2]
  def change
    create_table :gossips do |t|
      t.text :title
      t.text :content
      # t.references :users, foreign_key: true
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
