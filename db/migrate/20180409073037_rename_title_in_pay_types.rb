class RenameTitleInPayTypes < ActiveRecord::Migration[5.1]
  def change
    rename_column :pay_types, :title, :alias
  end
end
