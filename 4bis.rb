# frozen_string_literal: true

def get_file_as_string(filename)
  data = ''
  f = File.open(filename, "r")
  f.each_line do |line|
    data += line
  end
  data
end

superstring = get_file_as_string("t8.shakespeare1.txt")
dictionnary = get_file_as_string("swearwords.txt").split()
def parsing(string, dictionary)
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
print parsing(superstring,dictionnary)

