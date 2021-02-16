class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.decimal :price
      t.text :label

      t.timestamps
    end
  end
end
