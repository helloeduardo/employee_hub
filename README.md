# Employee Hub
  <p align="center">
    Employee Hub is a HR management platform for employees. Employees are able to log in and view their HR information. The app provides various levels of access for administrative users, managers, and HR employees.

    - Administrative users of the application manage users and permissions.
    - Managers can view and edit information about employees reporting to them.
    - Employees can view their information but do not have access to other Employees’ information.
    - Employees in the Human Resources department have access to information about all Employees, but don't have access to the information of other Employees in the Human Resources department.
  </p>
</p>


<!-- TABLE OF CONTENTS -->
## Table of Contents

* [Getting Started](#getting-started)
  * [Prerequisites](#prerequisites)
  * [Installation](#installation)
  * [Schema](#schema)
* [Usage](#usage)
* [Testing](#testing)
* [Improvements](#improvements)


<!-- GETTING STARTED -->
## Getting Started

To use Employee Hub locally, you can clone this repo.

### Prerequisites
* [Ruby 2.5.3](https://github.com/ruby/ruby)
* [Rails 5.2.4.5](https://github.com/rails/rails)
* [PostgreSQL](https://www.postgresql.org)


### Installation
Below are the commands you will need to run in your terminal once you are inside the employee_hub directory.

* Bundle Install
```
$ bundle exec install
```
* Set up Database
```
$ rails db:create
$ rails db:migrate
$ rails db:seed
```

### Schema

After running your migrations, your schema will look something like this!
<br />
<p align="center">
    <img src="https://user-images.githubusercontent.com/56360157/112611041-f192ff00-8de2-11eb-8f23-ddf05175a87b.png">
</p>


<!-- USAGE EXAMPLES -->
## Usage

Run ```rails s``` in your terminal and visit ```http://localhost:3000/``` in your browser

All 4 access levels will be seeded to the database.
- You may log in as a default user using the email `employee@example.com`.
- You may log in as an admin user using the email `admin@example.com`.
- You may log in as a manager user using the email `manager@example.com`.
- You may log in as an HR employee user using the email `hr@example.com`.

Once you are logged in you are redirected to your dashboard, where you may view your employee information (and potentially others' too if you've got permission!).

## Testing
Below is the command you will need to run in your terminal once you are inside the employee_hub directory to run tests built with RSpec.

```
$ bundle exec rspec
```

After running the tests, you may view the test coverage file with the following command:
```
$ open coverage/index.html
```

## Improvements
Some trade-offs were made to balance and timebox this application's initial features. One feature that could be improved upon include refactoring out salary into its own model to track salary histories over time and allow for managers and admins to "promote" an employee by creating a new salary for them. At the moment, employees are also unable to be re-assigned a different manager which would also be a useful feature to develop when considering workforce changes. Lastly, I prioritized seeding a database for local development to create new users. In the near future, I can envision adding a user creation workflow to users with admin privileges.
