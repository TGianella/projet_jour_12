def buying_day(arr)
  arr.index(arr.min)
end

def selling_day(arr, i)
  [i, arr[i..-1].index(arr[i..-1].max) + i]
end

def trading_day(arr)
  return "Erreur" if arr.class != Array
  return "Erreur" if arr.any? {|e| e.class != Integer && e.class != Float} || arr.empty?
  selling_day(arr, buying_day(arr))  
end
