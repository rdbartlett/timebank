class AddSuburbToContact < ActiveRecord::Migration
  def change
    add_column :contacts, :suburb, :string
  end
end
