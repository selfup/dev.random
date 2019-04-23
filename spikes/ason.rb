# https://gist.github.com/selfup/4dfb3c4e07e54f4e3ea8b5e8d2a841ac

require 'json'
require 'pry'

class PersonModel
  attr_reader :fn, :ln, :age, :uid

  def initialize(uid, fn, ln, age)
    @uid = uid
    @fn = fn
    @ln = ln
    @age = age
  end

  def to_hash
    {uid: @uid, fn: @fn, ln: @ln, age: @age}
  end

  def to_json
    self.to_hash.to_json
  end

  def to_arr
    [@uid, @fn, @ln, @age]
  end

  def to_ason
    ASON.stringify(self.to_arr)
  end

  def self.from_ason(ason)
    arr = ASON.parse(ason)
    { uid: arr[0].to_i, fn: arr[1], ln: arr[2], age: arr[3].to_i }
  end
end

class ASON
  def self.parse(str)
    str.split('|:|')
  end

  def self.stringify(arr)
    arr.join('|:|')
  end
end

person = PersonModel.new(0, "bob", "doe", 27)
p person.to_ason
p person.to_json

s1 = Time.now
json = (0..100_000).map do |n|
  per = PersonModel.new(n, "bob", "doe", 27).to_json
  JSON.parse(per)
  per
end.join(',')

File.write("tmp/json.txt", json)

f1 = Time.now
d1 = f1 - s1
puts "JSON time: #{d1}" # => JSON time: 1.105603665

s2 = Time.now
ason = (0..100_000).map do |n|
  per = PersonModel.new(n, "bob", "doe", 27).to_ason
  PersonModel.from_ason(per)
  per
end.join(',')

File.write("tmp/ason.txt", ason)

f2 = Time.now
d2 = f2 - s2
puts "ASON time: #{d2}" # => ASON time: 0.322794314
