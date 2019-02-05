class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :first_name
      t.string :last_name
      t.integer :age
      t.references :city, index: true
      # t.references :gossip , index: true

      t.timestamps
    end
  end
end
