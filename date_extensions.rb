Date.class_eval <<END
  QUARTERS = [1..3, 4..6, 7..9, 10..12]

  def quarter_number
    quarter = 0
    Date::QUARTERS.each_index do |i|
      if Date::QUARTERS[i].include?(self.month)
        quarter = i+1
        break
      end
    end
    return quarter
  end
  
  def beginning_of_quarter
    month = Date::QUARTERS[self.quarter_number-1].first
    return Date.new(Date.current.year, month, 1)
  end
  
  def end_of_quarter
    month = Date::QUARTERS[self.quarter_number-1].last
    month = Date.new(Date.current.year, month, 1)
    return month.end_of_month
  end
END

Fixnum.class_eval <<END
  def quarter; self * 3.months; end
  alias :quarters :quarter
END