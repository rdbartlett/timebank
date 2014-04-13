class RenameType < ActiveRecord::Migration
  def change
    change_column :services, :type, :service_type
  end
end
