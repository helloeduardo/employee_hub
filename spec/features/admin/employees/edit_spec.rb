describe 'As an admin' do
  it 'I can edit an employee' do
    employee = create(:admin)
    employee_2 = create(:employee)
    employee_3 = create(:employee)

    allow_any_instance_of(ApplicationController).to receive(:current_employee).and_return(employee)

    visit "/admin/employees/#{employee_2.id}/edit"

    fill_in "Department", with: "Human Resources"

    click_on 'Update Employee'

    expect(current_path).to eq("/admin/employees/#{employee_2.id}")
    expect(page).to have_content("Human Resources")
  end
end
