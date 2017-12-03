class RestructVisitRequestFields < ActiveRecord::Migration[5.1]
  def change
    remove_column :visits, :request

    add_column :visits, :user_agent, :string
    add_column :visits, :cookie, :string
    add_column :visits, :path_info, :string
    add_column :visits, :query_string, :string
  end
end
