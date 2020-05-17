class ExpensesController < ApplicationController
  def index
    if params[:q]
      @week_offset = params[:q]
    else
      @week_offset = 0
    end

    @start_date = Date.today.at_beginning_of_week + @week_offset.to_i.weeks
    @end_date = @start_date + 6.days

    @expenses = Expense
      .where('date > ?', @start_date)
      .where('date <= ?', @end_date)

    @total_cost = @expenses.sum {|e| e.cost}
  end

  def show
    @expense = Expense.find(params[:id])
  end

  def new
    @expense = Expense.new
  end

  def edit
    @expense = Expense.find(params[:id])
  end

  def create
    @expense = Expense.new(expense_params)

    if @expense.save
      redirect_to @expense
    else
      render 'new'
    end
  end

  def update
    @expense = Expense.find(params[:id])

    if @expense.update(expense_params)
      redirect_to @expense
    else
      render 'edit'
    end
  end

  def destroy
    @expense = Expense.find(params[:id])
    @expense.destroy

    redirect_to expenses_path
  end

  private
    def expense_params
      params.require(:expense).permit(:title, :cost, :date)
    end
end
