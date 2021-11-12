class CreateRequests < ActiveRecord::Migration[6.1]
  def change
    create_table :requests do |t|
      t.text :accepted_at
      t.text :declined_at

      t.timestamps
    end
  end
end
