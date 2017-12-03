class ChangeReferralToReferrer < ActiveRecord::Migration[5.1]
  def change
    rename_column :visits, :referral, :referer
  end
end
