class IndexController < ApplicationController
  def is_prime(n)
    for d in 2..(n - 1)
      if (n % d) == 0
        return false
      end
    end
    true
  end

  def output
    k = 0
    arr = []
    @error = ''
    @inp = params[:label]
    @error = 'Некорректный ввод' unless @inp =~ /^\d+$/
    @error = 'Некорректный ввод' if @inp == ''
    render 'error' unless @error.empty?
    g = @inp.to_i
    for i in g..( 2*g - 2 )
      if is_prime(i) && is_prime(i+2)
        arr << i
        arr << (i+2)
        arr << ','
        k += 1
      end
    end
    arr.pop
    @res = arr.join(" ")
    @res = 'Нет пар-близнецов' if k.zero?
  end
end
