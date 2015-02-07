class Account < ActiveRecord::Base
  def entries
    Entry.where("credit_account_id = ? OR debit_account_id = ?", self.id, self.id)
  end

  def balance
    total = 0
    id = self.id
    entries.each do |entry|
      if (entry.credit_account_id == id)
        total += entry.amount
      else
        total -= entry.amount
      end
    end
    return total
  end
end