class ClockInsController < ApplicationController
  def create
    # 出勤打刻を作成
    clock_in_time = DateTime.now
    clock_in_date = clock_in_time.to_date.to_s

    # 同じ日にすでに打刻がないかチェック
    if ClockIn.where(employee_id: current_employee.id, clock_in_date: clock_in_date).present?
      redirect_to new_attendance_path, alert: '退勤打刻に失敗しました。すでに打刻が記録されています'
    else
      if ClockIn.create(clock_in_time: clock_in_time, clock_in_date: clock_in_date, employee_id: current_employee.id)
        redirect_to new_attendance_path, notice: '出勤打刻を作成しました'
      else
        redirect_to new_attendance_path, alert: '出勤打刻に失敗しました'
      end
    end
  end
end
