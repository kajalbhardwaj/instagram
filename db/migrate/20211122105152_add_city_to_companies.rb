class AddCityToCompanies < ActiveRecord::Migration[6.1]
  def change
    add_column :companies, :city, :string
  
    
  end
end
