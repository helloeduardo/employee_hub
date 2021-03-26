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
end
