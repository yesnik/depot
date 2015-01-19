module Archivable
  extend ActiveSupport::Concern

  included do
    scope :published, -> { where(deleted_at: nil) }
  end

  def delete
    self.touch :deleted_at
  end

  def revive
    self.update_attribute :deleted_at, nil
  end
end