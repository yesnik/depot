# encoding: utf-8
module Loggable
  extend ActiveSupport::Concern

  included do
    after_create { |model| write_to_log(model) }
  end

  private

  def write_to_log(model)
    logger.info "#{Time.now} -- #{model.class.to_s} ##{model.id} was created"
  end
end
