class EmployeesController < ApplicationController
  before_action :move_to_login_path
  before_action :set_employee, only: [:index, :new, :create]

  def index
  end

  def new
  end

  def create
    if @employees.create(store_employee_params)
      redirect_to store_employees_path, notice: '従業員情報を作成しました'
    else
      redirect_to store_employees_path, notice: '従業員情報の作成に失敗しました'
    end
  end

  private

  def set_employee
    @store = Store.find(employee_params[:store_id])
    @employees = @store.employees
  rescue ActiveRecord::RecordNotFound
    redirect_to stores_path, alert: '店舗、または従業員情報が存在しません'
  end

  def employee_params
    params.permit(:store_id)
  end

  def store_employee_params
    params.permit(:store_id, :name)
  end
end
