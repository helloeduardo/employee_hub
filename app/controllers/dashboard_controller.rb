class DashboardController < ApplicationController
  before_action :require_employee

  def index
    @employee = Employee.find(current_employee.id)
  end
end
