class RestOutsController < ApplicationController
  def create
    # 休憩終打刻を作成
    rest_out_time = DateTime.now
    rest_out_date = rest_out_time.to_date.to_s

    # 同じ日にすでに打刻がないかチェック
    if current_employee.rest_outs.where(rest_out_date: rest_out_date).present?
      redirect_to new_attendance_path, alert: '打刻に失敗しました。すでに打刻が記録されています'
    else
      is_success = ActiveRecord::Base.transaction do
        rest_out = current_employee.rest_outs.create(rest_out_time: rest_out_time, rest_out_date: rest_out_date)
        attendance = current_employee.attendances.where(attendance_date: rest_out_date).first
        attendance.update(rest_out_id: rest_out.id)
      end

      if is_success
        redirect_to new_attendance_path, notice: '休憩終の打刻を作成しました'
      else
        redirect_to new_attendance_path, alert: '休憩終の打刻作成に失敗しました'
      end
    end
  end
end
