# confirming sonic pi method for creating pitch classes
# call scale and chord without tonics
# be careful may need to trim to the number of notes that you want
# because Sam likes to include the tonic an octave higher

scl = scale :chromatic ## includes 12

baz = [1,2,3]
n = 3
n.times { baz += baz }
puts baz

define :repeat do |n,t|
  Array.new(t) { n }
end

puts repeat 3Array.new(3) { 3 }
stop

puts [1,2,3].reverse

define :reverse do |n|
  n.to_a.reverse
end

define :rnd do |ns|
  [ns.choose]
end


define :rring do |r|
  res = []
  # go through ring and process all procedures
  r.collect do |x|
    if x.is_a? Array then
      res = res + x
    else
      res << x
    end
  end
  
  SonicPi::Core::RingVector.new res
end


foo = chord :c, :major

bar = foo + (repeat :d, 3) + (ring :d, :f, :a)

biz = ring :c, (repeat :e, 2), (repeat (reverse [:d, :f, :a]),2)
puts (rring biz)


stop
