def is_multiple_of_3_or_5?(nb)
  nb % 3 == 0 || nb % 5 == 0
end

def sum_of_3_or_5_multiples(nb)
  res = []
  if nb.class != Integer || nb < 0
    return "Je ne prends que les entiers naturels"
  end
  (nb).times do |i|
    is_multiple_of_3_or_5?(i) ? res << i : nil
  end
  res.sum
end

