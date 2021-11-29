class AddSecurityToCompanies < ActiveRecord::Migration[6.1]
  def change
    add_column :companies, :security, :text
  end
end
