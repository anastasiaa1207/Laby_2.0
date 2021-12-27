require "test_helper"

class TwinTest < ActiveSupport::TestCase
  test 'should not save empty model' do
    assert_not Twin.new.save
  end

  test 'should save correct model' do
    assert Twin.new(input: 11, values: [[11, 13], [17, 19]].to_json).save
  end

  test 'should not save with duplicate input' do
    assert_not Twin.new(input: 10, values: [[11, 13], [17, 19]].to_json).save
  end

  test 'should find data' do
    assert Twin.find_by_input(10)
  end

  test 'should not find data' do
    assert_not Twin.find_by_input(1001)
  end
end
