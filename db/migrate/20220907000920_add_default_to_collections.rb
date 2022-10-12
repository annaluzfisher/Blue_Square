class AddDefaultToCollections < ActiveRecord::Migration[7.0]
  def change
    change_column_default :collections, :activity, from: nil, to: false
  end
end
