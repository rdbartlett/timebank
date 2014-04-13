class CreateRenders < ActiveRecord::Migration
  def change
    create_table :renders do |t|

      t.timestamps
    end
  end
end
