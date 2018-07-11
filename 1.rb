# frozen_string_literal: true

def sum_of_multiple_3_and_5
  nbtrois = max_dernier_terme(3)
  nbcinq = max_dernier_terme(5)
  nbquinze = max_dernier_terme(15)
  sum(3, nbtrois) + sum(5, nbcinq) - sum(15, nbquinze)
end

def sum(multiple, dernier_terme)
  multiple * dernier_terme * (1 + dernier_terme) / 2
end

def max_dernier_terme(multiple)
  999 / multiple
end

puts sum_of_multiple_3_and_5
