class RestInsController < ApplicationController
  def create
    # 休憩始打刻を作成
    rest_in_time = DateTime.now
    rest_in_date = rest_in_time.to_date.to_s

    # 同じ日にすでに打刻がないかチェック
    if current_employee.rest_ins.where(rest_in_date: rest_in_date).present?
      redirect_to new_attendance_path, alert: '打刻に失敗しました。すでに打刻が記録されています'
    else
      is_success = ActiveRecord::Base.transaction do
        rest_in = current_employee.rest_ins.create(rest_in_time: rest_in_time, rest_in_date: rest_in_date)
        attendance = current_employee.attendances.where(attendance_date: rest_in_date).first
        attendance.update(rest_in_id: rest_in.id)
      end

      if is_success
        redirect_to new_attendance_path, notice: '休憩始の打刻を作成しました'
      else
        redirect_to new_attendance_path, alert: '休憩始の打刻作成に失敗しました'
      end
    end
  end
end
