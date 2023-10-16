class ChangeQuotePubDate < ActiveRecord::Migration[7.0]
  def change
    change_column_null :quotes, :pubyear, true
  end
end
