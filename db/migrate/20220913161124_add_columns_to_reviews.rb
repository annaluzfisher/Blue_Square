class AddColumnsToReviews < ActiveRecord::Migration[7.0]
  def change
    add_reference :reviews, :user, foreign_key: true
    add_reference :reviews, :item, foreign_key: true, null: false
    add_column :reviews, :title, :string, null: false
    add_column :reviews, :content, :string, null: false
    add_column :reviews, :rating, :integer, null: false
  end
end
