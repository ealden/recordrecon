class TargetTransaction < ActiveRecord::Base
  def self.to_hash
    targets = Hash.new

    all.each do |target|
      key = {
        :name => target.name,
        :processed_at => target.processed_at
      }

      targets[key] = target
    end

    targets
  end

  def to_a
    target_transaction = []
    target_transaction << name
    target_transaction << entered_at
    target_transaction << clearing
    target_transaction << allocated_at
    target_transaction << processed_at

    target_transaction
  end

  def cleared_at
    target_date = entered_at + clearing.days

    unless target_date.thursday? or target_date.friday?
      target_date += 2.days
    end

    target_date
  end
end
