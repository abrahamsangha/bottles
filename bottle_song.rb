require 'benchmark'

def bottle_song(number)
  number = number.to_i
  number.downto(1) do |int|
    view(int)
  end
end

def view(number)
  p "#{number} bottles of beer on the wall, #{number} bottles of beer."
  p "Take one down, pass it around, #{number-1} bottles of beer on the wall"
end

def bottle_song_recursive(number)
  if number == 0

  else
    view(number)
    bottle_song_recursive(number-1)
  end
end

# bottle_song_recursive(500)

Benchmark.bm do |bm|
  bm.report do
    bottle_song_recursive(500)
  end

  bm.report do
    bottle_song(500)
  end
end
