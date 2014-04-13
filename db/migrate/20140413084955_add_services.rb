class AddServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.text :body
      t.string :contact
      t.string :name
      t.string :title
      t.string :service_type

      t.timestamps
    end
  end
end
