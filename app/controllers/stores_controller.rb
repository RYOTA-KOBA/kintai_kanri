class StoresController < ApplicationController
  before_action :move_to_login_path
  before_action :set_store, only: [:index]
  before_action :set_employee, only: [:show]

  def index
  end

  def show
  end

  private

  def set_store
    @stores = Store.all
  end

  def set_employee
    @store = Store.find(employee_params[:id])
    @employees = @store.employees
  rescue ActiveRecord::RecordNotFound
    redirect_to stores_path, alert: '店舗、または従業員情報が存在しません'
  end

  def employee_params
    params.permit(:id, :store_id)
  end
end
