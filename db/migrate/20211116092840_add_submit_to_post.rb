class AddSubmitToPost < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :submit, :string
  end
end
