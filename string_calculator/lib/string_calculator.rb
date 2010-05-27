module StringCalculator
  def add
    return 0 if empty?
    raise_errors_if_negatives_exist
    digits.inject{ |sum,x| sum+x }
  end

  def digits
    @digits ||= self.gsub( "\n",delimiter ).split( delimiter ).map{ |x| x.to_i }
  end

  def delimiter
    @delimiter ||= self[ 0,2 ]=='//'?self[ 2,1 ]:','
  end

  def raise_errors_if_negatives_exist
    raise "Negative numbers found" if include? '-'
  end
end
