describe 'As a hr employee' do
  it 'I can see an employees information' do
    employee = create(:hr_employee)
    employee_2 = create(:hr_employee)
    employee_3 = create(:employee)
    employee_4 = create(:employee)

    allow_any_instance_of(ApplicationController).to receive(:current_employee).and_return(employee)

    visit "/hr/employees/#{employee_3.id}"

    expect(page).to have_content("#{employee_3.name}'s Dashboard")
    expect(page).to have_content(employee_3.email)
    expect(page).to have_content(employee_3.salary)
    expect(page).to have_content(employee_3.vacation_balance)
    expect(page).to have_content(employee_3.annual_bonus)
    expect(page).to have_content(employee_3.department)
  end
end
