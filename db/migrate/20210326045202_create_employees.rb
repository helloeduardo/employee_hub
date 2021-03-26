class CreateEmployees < ActiveRecord::Migration[5.2]
  def change
    create_table :employees do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.float :vacation_balance
      t.string :department

      t.timestamps
    end
  end
end
