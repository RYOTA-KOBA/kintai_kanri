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
        create_clock_out = current_employee.clock_outs.create(clock_out_time: clock_out_time, clock_out_date: clock_out_date)
        clock_out_id = create_clock_out.id
        clock_out = create_clock_out.clock_out_time
        clock_in_id = current_employee.clock_ins.find_by(clock_in_date: clock_out_date).id
        clock_in = current_employee.clock_ins.find_by(clock_in_date: clock_out_date).clock_in_time
        diff = DateTime.parse(clock_out.to_s) - DateTime.parse(clock_in.to_s)
        sec = (diff * 24 * 60 * 60).to_i
        # 労働時間合計
        working_time = Time.at(sec).utc.strftime('%X')
        # ここで休憩時間計算してrest_timeとrest_idに代入して以下でattendancesをcreate
        current_employee.attendances.create(working_time: working_time, rest_time: '01:00:00', rest_id: 1, clock_in_id: clock_in_id, clock_out_id: clock_out_id, rest_in_id: 7, rest_out_id: 6)
      end

      if is_success
        redirect_to new_attendance_path, notice: '退勤打刻を作成しました'
      else
        redirect_to new_attendance_path, alert: '退勤打刻に失敗しました'
      end
    end
  end
end
