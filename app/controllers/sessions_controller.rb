class SessionsController < ApplicationController
  def create
    employee = Employee.find_by(email: params[:email])
    if employee && employee.authenticate(params[:password])
      session[:employee_id] = employee.id
      flash[:notice] = "Welcome, #{employee.name}!"
      redirect_to '/dashboard'
    else
      flash[:notice] = 'Your email or password was incorrect!'
      redirect_to '/'
    end
  end

  def destroy
    session.delete(:employee_id)
    flash[:success] = 'You have been logged out.'
    redirect_to '/'
  end
end
