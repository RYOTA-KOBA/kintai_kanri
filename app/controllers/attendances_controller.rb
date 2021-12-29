class AttendancesController < ApplicationController
  before_action :move_to_login_path
  def index
  end

  def new
    @clock_in = ClockIn.new
    @clock_out = ClockOut.new
  end

  def create

  end
end
