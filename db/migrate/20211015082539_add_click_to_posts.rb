class AddClickToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :click, :string
  end
end
