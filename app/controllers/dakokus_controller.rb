class DakokusController < ApplicationController
  after_action :calculate_working_time, only: [:create]

  def new
    @dakoku = Dakoku.new
  end

  def create
    # 打刻日時の取得
    @dakoku_datetime = DateTime.now
    @dakoku_date = @dakoku_datetime.to_date.to_s

    # 同じ日にすでに打刻がないかチェック
    if current_employee.dakokus.where(dakoku_type: dakoku_params[:dakoku_type]).where('dakoku_datetime like ?', "%#{@dakoku_date}%").present?
      redirect_to new_dakoku_path, alert: '打刻に失敗しました。すでに打刻が記録されています'
    else
      is_success = ActiveRecord::Base.transaction do
        attendance = if dakoku_params[:dakoku_type] == 'syukkin'
                       current_employee.attendances.create(attendance_date: @dakoku_date)
                     else
                       get_attendance
                     end
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

  def dakoku_has_datetime_params
    dakoku_params.merge(dakoku_datetime: @dakoku_datetime, employee_id: current_employee.id)
  end

  def get_attendance
    current_employee.attendances.find_by(attendance_date: @dakoku_date)
  end

  def calculate_working_time
    if dakoku_params[:dakoku_type] == 'taikin'
      # 打刻日時の取得
      attendance = get_attendance

      dakoku_syukkin = attendance.dakokus.where(dakoku_type: 'syukkin').where('dakoku_datetime like ?', "%#{@dakoku_date}%")
      dakoku_kyukei_start = attendance.dakokus.where(dakoku_type: 'kyukei_start').where('dakoku_datetime like ?', "%#{@dakoku_date}%")
      dakoku_kyukei_end = attendance.dakokus.where(dakoku_type: 'kyukei_end').where('dakoku_datetime like ?', "%#{@dakoku_date}%")

      # 労働時間合計
      working_time_include_rest = calculate_total_time(dakoku_has_datetime_params[:dakoku_datetime], dakoku_syukkin.first.dakoku_datetime)
      rest_time = calculate_total_time(dakoku_kyukei_end.first.dakoku_datetime, dakoku_kyukei_start.first.dakoku_datetime) if dakoku_kyukei_start.present? && dakoku_kyukei_end.present?
      working_time = calculate_total_time(working_time_include_rest, rest_time)

      # 労働合計が6時間以上なら強制的に休憩1時間、4時間以上なら45分追加
      working_time = if working_time > '06:00:00'
                      (Time.zone.parse(working_time) - 1.hour).strftime('%X')
                    elsif working_time > '04:00:00'
                      (Time.zone.parse(working_time) - 0.75.hours).strftime('%X')
                    else
                      working_time
                    end
      attendance.update(working_time: working_time, rest_time: rest_time)
    end
  end
end
