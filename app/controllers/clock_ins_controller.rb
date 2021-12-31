class ClockInsController < ApplicationController
  def create
    # 出勤打刻を作成
    clock_in_time = DateTime.now
    clock_in_date = clock_in_time.to_date.to_s

    # 同じ日にすでに打刻がないかチェック
    if current_employee.clock_ins.where(clock_in_date: clock_in_date).present?
      redirect_to new_attendance_path, alert: '退勤打刻に失敗しました。すでに打刻が記録されています'
    else
      is_success = ActiveRecord::Base.transaction do
        create_clock_in = current_employee.clock_ins.create(clock_in_time: clock_in_time, clock_in_date: clock_in_date)
        current_employee.attendances.create(clock_in_id: create_clock_in.id, attendance_date: clock_in_date)
      end

      if is_success
        redirect_to new_attendance_path, notice: '出勤打刻を作成しました'
      else
        redirect_to new_attendance_path, alert: '出勤打刻に失敗しました'
      end
    end
  end
end
