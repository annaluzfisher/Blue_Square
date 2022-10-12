class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.string :description, null: false
      t.decimal :price, null: false
      t.decimal :discount, default: 0.0

      t.timestamps
    end
  end
end
