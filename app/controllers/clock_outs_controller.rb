class ClockOutsController < ApplicationController
  def create
    # 退勤打刻を作成
    clock_out_time = DateTime.now
    clock_out_date = clock_out_time.to_date.to_s

    # 同じ日にすでに打刻がないかチェック
    if current_employee.clock_outs.where(clock_out_date: clock_out_date).present?
      redirect_to new_attendance_path, alert: '退勤打刻に失敗しました。すでに打刻が記録されています'
    else
      is_success = ActiveRecord::Base.transaction do
        clock_out = current_employee.clock_outs.create(clock_out_time: clock_out_time, clock_out_date: clock_out_date)
        clock_in = current_employee.clock_ins.find_by(clock_in_date: clock_out_date)

        working_time_include_rest = calculate_total_time(clock_out.clock_out_time, clock_in.clock_in_time)
        attendance = current_employee.attendances.where(attendance_date: clock_out_date).first
        attendance.update(clock_out_id: clock_out.id)

        # 労働時間合計
        working_time = calculate_total_time(working_time_include_rest, attendance.rest_time)
        # 労働合計が6時間以上なら強制的に休憩1時間、4時間以上なら45分追加
        working_time = if working_time > '06:00:00'
                         (Time.zone.parse(working_time) - 1.hour).strftime('%X')
                       elsif working_time > '04:00:00'
                         (Time.zone.parse(working_time) - 0.75.hours).strftime('%X')
                       else
                         working_time
                       end
        attendance.update(working_time: working_time)
      end

      if is_success
        redirect_to new_attendance_path, notice: '退勤打刻を作成しました'
      else
        redirect_to new_attendance_path, alert: '退勤打刻に失敗しました'
      end
    end
  end
end
