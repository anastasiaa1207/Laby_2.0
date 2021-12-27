# frozen_string_literal: true

# main operating class
class Laba11Controller < ApplicationController
  before_action :prepare_variables, only: :result_table

  def enter_form; end

  def result_table
    twin = Twin.find_by_input @input
    if twin
      @values = JSON.parse twin.values
    else
      @values = Prime.take_while { |i| i <= 2 * @input }
                     .select { |num| num >= @input }.each_slice(2)
                     .select { |arr| arr.size > 1 && arr[1] - arr[0] == 2 }
      Twin.create(input: @input, values: @values.to_json)
    end
    xml_creation
  end

  private

  def prepare_variables
    @input = params[:input].to_i
  end

  def xml_creation
    twins = Twin.take(Twin.count)
    twins.map! { |x| { input: x.input, values: JSON.parse(x.values) } }
    @xml = twins.to_xml
  end
end
