class ExpensesController < ApplicationController
  def new
  end

  def create
    @expense = Expense.new(expense_params)

    @expense.save
    redirect_to @expense
  end

  def show
    @expense = Expense.find(params[:id])
  end

  private
    def expense_params
      params.require(:expense).permit(:title, :cost, :date)
    end
end
