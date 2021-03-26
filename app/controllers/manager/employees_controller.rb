class Manager::EmployeesController < Manager::BaseController
  def index
    @employees = current_employee.supervisees
  end

  def show
    @employee = Employee.find(params[:id])
  end

  def edit
    @employee = Employee.find(params[:id])
  end

  def update
    @employee = Employee.find(params[:id])
    respond_to do |format|
      if @employee.update(employee_params)
        format.html { redirect_to manager_employee_path(@employee), notice: "Employee was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  private

  def employee_params
    params.require(:employee).permit(:name, :email, :salary, :annual_bonus, :vacation_balance, :department)
  end

end
