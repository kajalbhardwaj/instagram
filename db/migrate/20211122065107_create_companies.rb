class CreateCompanies < ActiveRecord::Migration[6.1]
  def change
    create_table :companies do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.integer :no_of_employees
      t.string :gender
      t.float :salary
      t.text :password
      t.timestamps
    end
  end
end
