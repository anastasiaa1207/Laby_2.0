class IndexController < ApplicationController
  before_action :prepare_class_variables, only: :result

  def enter_form; end

  def result
    count
    render partial: 'result', locals: { numbers: @numbers }, layout: false
  end

  def is_prime(n)
    for d in 2..(n - 1)
      if (n % d) == 0
        return false
      end
    end
    true
  end

  def count
    arr = []
    g = @number
    for i in g..( 2*g - 2 )
      if is_prime(i) && is_prime(i+2)
        arr << i
        arr << (i+2)
        arr << ','
      end
    end
    arr.pop
    @numbers = arr.join(" ")
  end

  private

  def prepare_class_variables
    @number = params[:number].to_i
    @numbers = []
  end

end
