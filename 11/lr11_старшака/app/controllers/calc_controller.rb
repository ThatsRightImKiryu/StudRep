class CalcController < ApplicationController
  def index; end

  def view
    num = params[:num].to_i
    if res = CalcResult.find_by_num(num)
      @result = ActiveSupport::JSON.decode(res.result)
    else
      mas = [[]]
      c = 1
      num.times do
        ch = c.to_s
        dv = c.to_s(2)
        mas << [ch.to_i, dv.to_i] if (ch == ch.reverse) && (dv == dv.reverse)
        c += 1
      end
      @result = mas
      res = CalcResult.create num: num, result: ActiveSupport::JSON.encode(@result)
      res.save
    end
  end
end
