class CreateExpenses < ActiveRecord::Migration[6.0]
  def change
    create_table :expenses do |t|
      t.string :title
      t.float :cost
      t.datetime :date

      t.timestamps
    end
  end
end
