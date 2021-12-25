class ApplicationController < ActionController::Base
  private

  def move_to_login_path
    unless employee_signed_in?
      redirect_to employee_session_path, alert: 'ログインが必要です。'
    end
  end
end
