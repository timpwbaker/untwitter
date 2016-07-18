class ChangeDateFormatInMessagesTable < ActiveRecord::Migration
  def change
	def up
		change_column :messages, :publish_date, :datetime
	end

	def down
		change_column :messages, :publish_date, :date
	end
  end
end
