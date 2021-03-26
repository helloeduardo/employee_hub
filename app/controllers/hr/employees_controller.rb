class Hr::EmployeesController < Hr::BaseController
  def index
    @employees = Employee.all_except_hr
  end

  def show
    @employee = Employee.find(params[:id])
  end
end
