class AddPhonenoToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :phoneno, :integer
  end
end
