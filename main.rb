# frozen_string_literal: true

def scale(v_b, v_h, &func)
  v_b / (-2..2).step(v_h).map { |x| func.call(x) }.max
end