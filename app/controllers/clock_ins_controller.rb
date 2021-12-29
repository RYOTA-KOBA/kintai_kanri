class ClockInsController < ApplicationController
  def create
    # 出勤打刻を作成
    clock_in_time = DateTime.now
    clock_in_date = clock_in_time.to_date.to_s
    if ClockIn.create(clock_in_time: clock_in_time, clock_in_date: clock_in_date)
      redirect_to new_attendance_path, notice: '出勤打刻を作成しました'
    else
      redirect_to new_attendance_path, alert: '出勤打刻に失敗しました'
    end
  end
end
