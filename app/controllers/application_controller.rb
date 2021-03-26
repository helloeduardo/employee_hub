class ApplicationController < ActionController::Base
  helper_method :current_employee, :current_manager?, :current_admin?, :current_hr_employee?

  def current_employee
    @current_employee ||= Employee.find(session[:employee_id]) if session[:employee_id]
  end

  def current_manager?
    current_employee && current_employee.manager?
  end

  def current_admin?
    current_employee && current_employee.admin?
  end

  def current_hr_employee?
    current_employee && current_employee.hr_employee?
  end

  def require_employee
    render file: 'public/404', status: :not_found unless current_employee
  end

  def require_manager
    render file: 'public/404', status: 404 unless current_manager?
  end

  def require_admin
    render file: 'public/404', status: 404 unless current_admin?
  end

  def require_hr_employee
    render file: 'public/404', status: 404 unless current_hr_employee?
  end
end
