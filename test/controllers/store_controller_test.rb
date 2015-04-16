# encoding: utf-8
require 'test_helper'

class StoreControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_select '#columns #side a', minimum: 2
    assert_select '#main .entry', Product.all.size
    assert_select 'h3', 'Programming Ruby 1.9'
    assert_select '.datetime_current', /Сейча.+/
    assert_select '.price', /[,\d]+\.\d\d\sруб/
  end

end
