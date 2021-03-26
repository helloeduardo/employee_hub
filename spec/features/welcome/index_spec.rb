describe "Welcome Page" do
  describe "As a visitor" do
    it "I can log in" do
      employee = create(:employee)

      visit "/"

      fill_in :email, with: employee.email
      fill_in :password, with: employee.password

      click_on "Login"

      expect(current_path).to eq('/dashboard')
      expect(page).to have_content("Welcome, #{employee.name}!")
    end

    it "I cannot log in with invalid credentials" do
      visit "/"

      fill_in :email, with: 'not_an_employee@example.com'

      click_on "Login"

      expect(current_path).to eq('/')
      expect(page).to have_content("Your email or password was incorrect!")
    end
  end

  describe "As an authenticated user" do
    it "I can log out" do
      employee = create(:employee)

      visit "/"

      fill_in :email, with: employee.email
      fill_in :password, with: employee.password

      click_on "Login"

      click_on "Logout"

      expect(current_path).to eq("/")
      expect(page).to have_content("You have been logged out.")
    end
  end

  describe "As a visitor" do
    it "I do not see logout if I am not logged in" do
      visit "/"
      expect(page).to_not have_content("Logout")
    end
  end
end
