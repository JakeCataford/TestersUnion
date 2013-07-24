class AddsUserIdToTokens < ActiveRecord::Migration
  def change
  	add_column :tokens, :lead_id, :integer
  end
end
