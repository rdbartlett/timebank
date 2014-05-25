class AddSuburbToService < ActiveRecord::Migration
  def change
    add_column :services, :suburb, :string
  end
end
