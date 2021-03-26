describe 'As a manager' do
  it 'I can edit a supervisee' do
    employee = create(:manager)
    supervisee_1 = create(:employee, manager: employee)
    supervisee_2 = create(:employee, manager: employee)
    not_a_supervisee = create(:employee, :with_manager)

    allow_any_instance_of(ApplicationController).to receive(:current_employee).and_return(employee)

    visit "/manager/employees/#{supervisee_1.id}/edit"

    fill_in "Department", with: "Human Resources"

    click_on 'Update Employee'

    expect(current_path).to eq("/manager/employees/#{supervisee_1.id}")
    expect(page).to have_content("Human Resources")
  end
end
