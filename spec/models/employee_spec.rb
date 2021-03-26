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
end
