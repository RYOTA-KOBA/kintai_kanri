class AttendancesController < ApplicationController
  before_action :move_to_login_path
  def index
    @attendances = current_employee.attendances
  end
end
