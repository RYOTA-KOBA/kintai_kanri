class ClockOutsController < ApplicationController
  def create
    # 退勤打刻を作成
    clock_out_time = DateTime.now
    clock_out_date = clock_out_time.to_date.to_s
    if ClockOut.create(clock_out_time: clock_out_time, clock_out_date: clock_out_date)
      redirect_to new_attendance_path, notice: '退勤打刻を作成しました'
    else
      redirect_to new_attendance_path, alert: '退勤打刻に失敗しました'
    end
  end
end
