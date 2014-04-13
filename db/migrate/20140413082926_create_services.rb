class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :name
      t.string :title
      t.text :body
      t.string :contact

      t.timestamps
    end
  end
end
