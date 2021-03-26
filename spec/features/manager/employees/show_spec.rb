describe 'As a manager' do
  it 'I see my supervisees information and a link to edit' do
    employee = create(:manager)
    supervisee_1 = create(:employee, manager: employee)
    supervisee_2 = create(:employee, manager: employee)
    not_a_supervisee = create(:employee, :with_manager)

    allow_any_instance_of(ApplicationController).to receive(:current_employee).and_return(employee)

    visit "/manager/employees/#{supervisee_1.id}"

    expect(page).to have_content("#{supervisee_1.name}'s Dashboard")
    expect(page).to have_content(supervisee_1.email)
    expect(page).to have_content(supervisee_1.salary)
    expect(page).to have_content(supervisee_1.vacation_balance)
    expect(page).to have_content(supervisee_1.annual_bonus)
    expect(page).to have_content(supervisee_1.department)
    expect(page).to have_content(supervisee_1.manager.name)

    click_link "Edit"

    expect(current_path).to eq("/manager/employees/#{supervisee_1.id}/edit")
  end
end
