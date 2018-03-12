class MigratePayTypeInOrders < ActiveRecord::Migration[5.1]
  def up
    execute <<-SQL
      UPDATE orders SET pay_type_id = pay_type;
    SQL
  end

  def down
    execute <<-SQL
      UPDATE orders SET pay_type = pay_type_id;
    SQL
  end
end
