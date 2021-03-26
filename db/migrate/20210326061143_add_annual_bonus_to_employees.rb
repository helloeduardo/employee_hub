class AddAnnualBonusToEmployees < ActiveRecord::Migration[5.2]
  def change
    add_column :employees, :annual_bonus, :integer
  end
end
