describe 'As an admin' do
  it 'I see all employees and a view info button' do
    employee = create(:admin)
    employee_2 = create(:employee)
    employee_3 = create(:employee)

    allow_any_instance_of(ApplicationController).to receive(:current_employee).and_return(employee)

    visit '/admin/employees'

    expect(page).to have_content(employee_3.name)
    expect(page).to have_content(employee_2.name)

    within first('li') do
      click_link "View details"
    end

    expect(current_path).to eq("/admin/employees/#{employee.id}")
  end
end
