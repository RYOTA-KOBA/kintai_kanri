class AttendancesController < ApplicationController
  before_action :move_to_login_path
  def index
    @attendances = current_employee.attendances
  end

  def new
    @clock_in = ClockIn.new
    @clock_out = ClockOut.new
    @rest_in = RestIn.new
    @rest_out = RestOut.new
  end

  def create
  end
end
