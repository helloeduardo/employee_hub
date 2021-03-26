class Hr::BaseController < ApplicationController
  before_action :require_hr_employee
end
