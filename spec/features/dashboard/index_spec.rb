describe 'Dashboard' do
  describe 'As an employee' do
    it 'I see my current salary, vacation balance, annual bonus information, department, and manager' do
      employee = create(:employee, :with_manager)
      allow_any_instance_of(ApplicationController).to receive(:current_employee).and_return(employee)

      visit '/dashboard'

      expect(page).to have_content("#{employee.name}'s Dashboard")
      expect(page).to have_content(employee.email)
      expect(page).to have_content(employee.salary)
      expect(page).to have_content(employee.vacation_balance)
      expect(page).to have_content(employee.annual_bonus)
      expect(page).to have_content(employee.department)
      expect(page).to have_content(employee.manager.name)
    end
  end

  describe 'As a manager' do
    it 'I see my info and a link to view all supervisees' do
      employee = create(:manager)
      supervisee_1 = create(:employee, manager: employee)
      supervisee_2 = create(:employee, manager: employee)
      not_a_supervisee = create(:employee, :with_manager)

      allow_any_instance_of(ApplicationController).to receive(:current_employee).and_return(employee)

      visit '/dashboard'

      expect(page).to have_content("#{employee.name}'s Dashboard")
      expect(page).to have_content(employee.email)
      expect(page).to have_content(employee.salary)
      expect(page).to have_content(employee.vacation_balance)
      expect(page).to have_content(employee.annual_bonus)
      expect(page).to have_content(employee.department)

      click_link('View Supervisees')

      expect(current_path).to eq('/manager/employees')

      expect(page).to have_content(supervisee_1.name)
      expect(page).to have_content(supervisee_2.name)
      expect(page).to_not have_content(not_a_supervisee.name)
    end
  end

  describe 'As an admin' do
    it 'I see my info and a link to view all employees' do
      employee = create(:admin)
      employee_2 = create(:employee)
      employee_3 = create(:employee)

      allow_any_instance_of(ApplicationController).to receive(:current_employee).and_return(employee)

      visit '/dashboard'

      expect(page).to have_content("#{employee.name}'s Dashboard")
      expect(page).to have_content(employee.email)
      expect(page).to have_content(employee.salary)
      expect(page).to have_content(employee.vacation_balance)
      expect(page).to have_content(employee.annual_bonus)
      expect(page).to have_content(employee.department)

      click_link('View All Employees')

      expect(current_path).to eq('/admin/employees')

      expect(page).to have_content(employee.name)
      expect(page).to have_content(employee_2.name)
      expect(page).to have_content(employee_3.name)
    end
  end

  describe 'As an HR Employee' do
    it 'I see my info and a link to view all employees' do
      employee = create(:hr_employee)
      employee_2 = create(:hr_employee)
      employee_3 = create(:employee)

      allow_any_instance_of(ApplicationController).to receive(:current_employee).and_return(employee)

      visit '/dashboard'

      expect(page).to have_content("#{employee.name}'s Dashboard")
      expect(page).to have_content(employee.email)
      expect(page).to have_content(employee.salary)
      expect(page).to have_content(employee.vacation_balance)
      expect(page).to have_content(employee.annual_bonus)
      expect(page).to have_content(employee.department)

      click_link('View Non-HR Employees')

      expect(current_path).to eq('/hr/employees')

      expect(page).to_not have_content(employee.name)
      expect(page).to_not have_content(employee_2.name)
      expect(page).to have_content(employee_3.name)
    end
  end
end
