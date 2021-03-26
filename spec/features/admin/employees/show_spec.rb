describe 'As an admin' do
  it 'I see my employees information and a link to edit' do
    employee = create(:admin)
    employee_2 = create(:employee)
    employee_3 = create(:employee)

    allow_any_instance_of(ApplicationController).to receive(:current_employee).and_return(employee)

    visit "/admin/employees/#{employee_2.id}"

    expect(page).to have_content("#{employee_2.name}'s Dashboard")
    expect(page).to have_content(employee_2.email)
    expect(page).to have_content(employee_2.salary)
    expect(page).to have_content(employee_2.vacation_balance)
    expect(page).to have_content(employee_2.annual_bonus)
    expect(page).to have_content(employee_2.department)
    expect(page).to have_content(employee_2.role)

    click_link "Edit"

    expect(current_path).to eq("/admin/employees/#{employee_2.id}/edit")
  end
end
