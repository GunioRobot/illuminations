class Fixnum
  TENS_PLACE_ENGLISH  = [nil, nil, 'twenty', 'thirty', 'forty', 'fifty', 'sixty', 'seventy', 'eighty', 'ninety']
  TEENS_ENGLISH       = ['ten', 'eleven', 'twelve', 'thirteen', 'fourteen', 'fifteen', 'sixteen', 'seventeen', 'eighteen', 'nineteen', 'twenty']
  ONES_PLACE_ENGLISH  = ['zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine']
  
  def to_english
    english = []
    string = self.to_s
    arity = string.length
    if arity == 3
      english << ONES_PLACE_ENGLISH[string[0..0].to_i] << ' hundred '
      string = string[1..-1]
      arity = 2
    end
    
    if arity == 2
      if string[0..0] == '1'
        english << TEENS_ENGLISH[string[-1..-1].to_i]
      else
        english << TENS_PLACE_ENGLISH[string[0..0].to_i]
        english << '-' << ONES_PLACE_ENGLISH[string[-1..-1].to_i] if string[-1..-1] != '0'
      end
    end
    
    if arity == 1
      english << ONES_PLACE_ENGLISH[string[0..0].to_i]
    end
    
    english.compact.join('')
  end
end

class Float
  def to_english
    self.to_i.to_english
  end
end

class Bignum
  def to_english; ''; end
end