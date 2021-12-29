class ClockOutsController < ApplicationController
  def create
    # 退勤打刻を作成
    clock_out_time = DateTime.now
    clock_out_date = clock_out_time.to_date.to_s

    # 同じ日にすでに打刻がないかチェック
    if ClockOut.where(employee_id: current_employee.id, clock_out_date: clock_out_date).present?
      redirect_to new_attendance_path, alert: '退勤打刻に失敗しました。すでに打刻が記録されています'
    else
      if ClockOut.create(clock_out_time: clock_out_time, clock_out_date: clock_out_date, employee_id: current_employee.id)
        redirect_to new_attendance_path, notice: '退勤打刻を作成しました'
      else
        redirect_to new_attendance_path, alert: '退勤打刻に失敗しました'
      end
    end
  end
end
