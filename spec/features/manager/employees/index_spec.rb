describe 'As a manager' do
  it 'I see all supervisees and a view info button' do
    employee = create(:manager)
    supervisee_1 = create(:employee, manager: employee)
    supervisee_2 = create(:employee, manager: employee)
    not_a_supervisee = create(:employee, :with_manager)

    allow_any_instance_of(ApplicationController).to receive(:current_employee).and_return(employee)

    visit '/manager/employees'

    expect(page).to have_content(supervisee_1.name)
    expect(page).to have_content(supervisee_2.name)
    expect(page).to_not have_content(not_a_supervisee.name)

    within first('li') do
      click_link "View details"
    end

    expect(current_path).to eq("/manager/employees/#{supervisee_1.id}")
  end
end
