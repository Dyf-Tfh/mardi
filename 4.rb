# frozen_string_literal: true

dictionary = ["below", "down", "go", "going", "horn", "how", "howdy", "it", "i", "low", "own", "part", "partner", "sit"]

def parsing(string, dictionary)
  # string.delete(/[a-zA-Z\d\s:]/.to_s)
  compteur = {}
  dictionary.each{ |i|
    compteur[i] = 0
  }
  string.downcase.split.each { |item|
    item.delete!("!")
    item.delete!("?")
    item.delete!("\'s")
    item.delete!("\,")
    item.delete!("\.")
    item.delete!("\"")
    if dictionary.include?(item)
      compteur[item] += 1
    end
  }
  compteur
end
puts parsing("Howdy partner, sit down! How's it going?", dictionary)
