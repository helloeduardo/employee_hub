class Manager::BaseController < ApplicationController
  before_action :require_manager
end
