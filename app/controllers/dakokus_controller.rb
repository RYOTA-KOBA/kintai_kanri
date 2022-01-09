class DakokusController < ApplicationController
  def new
    @dakoku = Dakoku.new
  end

  def create
    # 打刻日時の取得
    dakoku_datetime = DateTime.now
    dakoku_date = dakoku_datetime.to_date.to_s

    # 同じ日にすでに打刻がないかチェック
    if current_employee.dakokus.where(dakoku_type: dakoku_params[:dakoku_type]).where('dakoku_datetime like ?', "%#{dakoku_date}%" ).present?
      redirect_to new_dakoku_path, alert: '打刻に失敗しました。すでに打刻が記録されています'
    else
      is_success = ActiveRecord::Base.transaction do
        attendance = if dakoku_params[:dakoku_type] == 'syukkin'
                       current_employee.attendances.create(attendance_date: dakoku_date)
                     else
                       current_employee.attendances.find_by(attendance_date: dakoku_date)
                     end
        dakoku_has_datetime_params = dakoku_params.merge(dakoku_datetime: dakoku_datetime, employee_id: current_employee.id)
        attendance.dakokus.create(dakoku_has_datetime_params)
      end

      if is_success
        redirect_to new_dakoku_path, notice: '打刻を作成しました'
      else
        redirect_to new_dakoku_path, alert: '打刻に失敗しました'
      end
    end
  end

  def edit
  end

  def update
  end

  private

  def dakoku_params
    params.require(:dakoku).permit(:dakoku_type)
  end
end
