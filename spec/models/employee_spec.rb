describe Employee do
  describe "Validations" do
    it {should validate_presence_of :email}
    it {should validate_uniqueness_of :email}
    it {should validate_presence_of :name}
  end

  describe "Relationship" do
    it { should have_many(:supervisees) }
    it { should belong_to(:manager).optional }
  end

  describe "Class Methods" do
    describe "#all_except_hr" do
      it 'returns all employees not in human resources' do
        employee = create(:hr_employee)
        employee_2 = create(:hr_employee)
        employee_3 = create(:employee)
        employee_4 = create(:employee)

        expect(Employee.all_except_hr).to eq([employee_3, employee_4])
        expect(Employee.all_except_hr).to_not include(employee)
        expect(Employee.all_except_hr).to_not include(employee_2)
      end
    end
  end
end
