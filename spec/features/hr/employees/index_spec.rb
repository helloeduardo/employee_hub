describe 'As a hr employee' do
  it 'I see all employees except other HR employees and a view info button' do
    employee = create(:hr_employee)
    employee_2 = create(:hr_employee)
    employee_3 = create(:employee)
    employee_4 = create(:employee)

    allow_any_instance_of(ApplicationController).to receive(:current_employee).and_return(employee)

    visit '/hr/employees'

    expect(page).to_not have_content(employee.name)
    expect(page).to_not have_content(employee_2.name)
    expect(page).to have_content(employee_3.name)
    expect(page).to have_content(employee_4.name)

    within first('li') do
      click_link "View details"
    end

    expect(current_path).to eq("/hr/employees/#{employee_3.id}")
  end
end
