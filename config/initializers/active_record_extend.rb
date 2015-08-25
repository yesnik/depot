# encoding: utf-8
require 'encrypter'

class ActiveRecord::Base
  def self.encrypt(*attr_names)
    encrypter = Encrypter.new(attr_names)
    before_save encrypter
    after_save encrypter
    after_find encrypter
    define_method(:after_find) { }
  end
end