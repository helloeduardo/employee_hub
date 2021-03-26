class Employee < ApplicationRecord
  has_secure_password

  validates :email, uniqueness: true, presence: true
  validates :name, presence: true

  has_many :supervisees, class_name: "Employee",
                          foreign_key: "manager_id"

  belongs_to :manager, class_name: "Employee", optional: true

  enum role: ['default', 'hr_employee', 'manager', 'admin']

  def self.all_except_hr
    where.not(department: 'Human Resources' )
  end
end
