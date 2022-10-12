class AddColumnsToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :first_name, :string, null: false
    add_column :users, :last_name, :string, null: false
    add_column :users, :company_name, :string
    add_column :users, :mailing_list, :boolean, default: false
  end
end
