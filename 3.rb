# frozen_string_literal: true

jour_1 = { GOO: 15, MMM: 14, ADBE: 12, EA: 13, BA: 8, KO: 10, XOM: 20, GPS: 7, MCD: 11, DIS: 15, CRM: 6, JNJ: 10 }
jour_2 = { GOO: 8, MMM: 20, ADBE: 3, EA: 10, BA: 5, KO: 19, XOM: 12, GPS: 6, MCD: 15, DIS: 9, CRM: 10, JNJ: 17 }
jour_3 = { GOO: 3, MMM: 8, ADBE: 15, EA: 5, BA: 10, KO: 5, XOM: 15, GPS: 13, MCD: 10, DIS: 18, CRM: 5, JNJ: 14 }
jour_4 = { GOO: 17, MMM: 3, ADBE: 6, EA: 9, BA: 15, KO: 6, XOM: 8, GPS: 1, MCD: 10, DIS: 15, CRM: 18, JNJ: 3 }
jour_5 = { GOO: 8, MMM: 18, ADBE: 4, EA: 6, BA: 15, KO: 18, XOM: 3, GPS: 12, MCD: 19, DIS: 3, CRM: 7, JNJ: 9 }
jour_6 = { GOO: 10, MMM: 12, ADBE: 8, EA: 3, BA: 18, KO: 20, XOM: 5, GPS: 11, MCD: 3, DIS: 9, CRM: 8, JNJ: 15 }
jour_7 = { GOO: 17, MMM: 14, ADBE: 2, EA: 17, BA: 7, KO: 13, XOM: 1, GPS: 15, MCD: 15, DIS: 10, CRM: 9, JNJ: 17 }

def trader_du_dimanche(array)
  hash = {}
  day_array = []
  value_array = []
  jour = 0
  array.size.times do
    a = jour
    jour_max = jour
    (array.size - jour).times do
      # a c'est le second jour
      # jour_max c'est le jour pour lequel la différence est maximale
      if array[a] - array[jour] > array[jour_max] - array[jour]
        jour_max = a
        day_array = [jour, jour_max]
        dyf = array[jour_max] - array[jour]
        value_array << dyf
        hash.store( day_array.to_s, dyf )
      end
      a += 1
    end
    jour += 1
  end
  hash.key(value_array.max).to_s + " $" + value_array.max.to_s
end

def arrayfy(a, b, c, d, e, f, g)
  [a, b, c, d, e, f, g]
end

def get_entreprise_name(jour)
  entreprise = []
  jour.each_key { |key|
    entreprise << key
  }
  entreprise
end

def get_hyperhash(entreprise, super_array)
  hyperhash = {}
  entreprise.each { |nom|
    tableau = []
    super_array.each { |hash_jour|
      tableau << hash_jour[nom]
    }
    hyperhash[nom] = tableau
  }
  hyperhash
end

def trader_du_lundi(super_array)
  hash_resultat = {}
  entreprise = get_entreprise_name(super_array[0])
  hyperhash = get_hyperhash(entreprise, super_array)
  hyperhash.each{ |key, value|
    hash_resultat.store(key, trader_du_dimanche(value))
  }
  hash_resultat
end

super_array = arrayfy(jour_1, jour_2, jour_3, jour_4, jour_5, jour_6, jour_7)
puts trader_du_lundi(super_array)
