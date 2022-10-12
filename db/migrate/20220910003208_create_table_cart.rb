class CreateTableCart < ActiveRecord::Migration[7.0]
  def change
    create_table :carts do |t|
      t.references :user, foreign_key:true
      t.timestamps
    end
  end
    def change
    create_table :cart_items do |t|
      t.references :user, foreign_key: true
      t.references :item, foreign_key: true
      t.timestamps
    end
  end

end
