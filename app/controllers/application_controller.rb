class ApplicationController < ActionController::Base
  private

  def move_to_login_path
    unless employee_signed_in?
      redirect_to employee_session_path, alert: 'ログインが必要です。'
    end
  end

  def calculate_total_time(out_time, in_time)
    return out_time if in_time.nil?
    # 差分の計算
    diff = DateTime.parse(out_time.to_s) - DateTime.parse(in_time.to_s)
    sec = (diff * 24 * 60 * 60).to_i
    # 労働や休憩の合計
    Time.at(sec).utc.strftime('%X')
  end
end
