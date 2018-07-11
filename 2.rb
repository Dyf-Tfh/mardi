# frozen_string_literal: true

def decalage(bytecode, dec)
  if bytecode <= 90 && bytecode >= 65
    if bytecode <= 85
      bytecode + dec
    else
      bytecode + dec - 90
    end
  elsif bytecode <= 122 && bytecode >= 97
    if bytecode <= 117
      bytecode + dec
    else
      bytecode + dec - 122
    end
  else
    bytecode
  end
end

def chifr(string, dec)
  array = []
  string.each_byte{ |bit|
    bit_decaled = decalage(bit, dec)
    array << bit_decaled
  }
  array.map(&:chr).join(" ")
end
puts chifr("Jemange des fraises!!", 5)
