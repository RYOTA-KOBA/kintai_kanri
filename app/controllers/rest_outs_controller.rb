class RestOutsController < ApplicationController
  def create
    # 休憩終打刻を作成
    rest_out_time = DateTime.now
    rest_out_date = rest_out_time.to_date.to_s

    # 同じ日にすでに打刻がないかチェック
    if RestOut.where(employee_id: current_employee.id, rest_out_date: rest_out_date).present?
      redirect_to new_attendance_path, alert: '打刻に失敗しました。すでに打刻が記録されています'
    else
      if RestOut.create(rest_out_time: rest_out_time, rest_out_date: rest_out_date, employee_id: current_employee.id)
        redirect_to new_attendance_path, notice: '休憩終の打刻を作成しました'
      else
        redirect_to new_attendance_path, alert: '休憩終の打刻作成に失敗しました'
      end
    end
  end
end
