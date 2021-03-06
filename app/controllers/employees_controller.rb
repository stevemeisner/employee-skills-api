# frozen_string_literal: true

class EmployeesController < ApplicationController
  before_action :set_employee, only: %i[show update add_skill destroy]

  # GET /employees
  def index
    @employees = Employee.all

    # this wasn't going well. I would prefer to do the data transformation server side, but right now it's happening client side.
    # @employees.map do |employee|
    #   employee.skill_list = employee.skill_list.flat_map { |skill| { value: skill } }
    # end

    render json: @employees
  end

  # GET /employees/1
  def show
    render json: @employee
  end

  # POST /employees
  def create
    @employee = Employee.new(employee_params)

    if @employee.save
      render json: @employee, status: :created, location: @employee
    else
      render json: @employee.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /employees/1
  def update
    if @employee.update(employee_params)
      render json: @employee
    else
      render json: @employee.errors, status: :unprocessable_entity
    end
  end

  # DELETE /employees/1
  def destroy
    @employee.destroy
  end

  # PATCH /employees/:id/:skill
  def add_skill
    @employee.skill_list.add(params[:skill_list], parse: true)
    @employee.save
  end

  # GET /employees/:skill
  def skills
    @employees = if params[:skill].present?
                   Employee.tagged_with(params[:skill])
                 else
                   Employee.all
                 end

    render json: @employees
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_employee
    @employee = Employee.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def employee_params
    params.require(:employee).permit(:first_name, :last_name, :start_date, :field_start_date, :skill_list)
  end
end
