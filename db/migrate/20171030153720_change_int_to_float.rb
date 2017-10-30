class ChangeIntToFloat < ActiveRecord::Migration
  def up
    change_column :reviews, :score, :float
  end

  def down
    change_column :reviews, :score, :integer
  end
end
