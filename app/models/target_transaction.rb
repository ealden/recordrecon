class TargetTransaction < ActiveRecord::Base
  def to_a
    target_transaction = []
    target_transaction << name
    target_transaction << entered_at
    target_transaction << clearing
    target_transaction << allocated_at
    target_transaction << processed_at

    target_transaction
  end
end
