print 'Hello, World!'
print('Hello, World!')
# => "Hello, World!"

greeting = 'Hello, World!'

print greeting
# => "Hello, World!"


print 1 + 1
# => 2

a = 1 + 2

print a
# => 3

a = a + 1 # 4
a += 1 # a = a + 1
a *= 2 # a = a * 2
a /= 3 # a = a / 3
a %= 4 # деление с остатком

a = 2**2 # возведение в степень
a **= 2 # a = a ** 2

a = 5 / 2 # Integer / Integer = Integer
print a # => 2
a = 5.to_f / 2 # Float / Integer = Float
print a # => 2.5

print 'Hello' + ' ' + 'World!'
# => "Hello, World!"

world = 'World'

print "Hello #{world}!"
# => "Hello, World!"

print 'Hello #{world}!'
# => "Hello #{world}!"

print 'Hello, World!'[0]
# => "H"

print 'Hello, World!'[0..4]
# => "Hello"

print 'Hello, World!'[0...4]
# => "Hell"

print 'Hello, World!'[/Hello/]
# => "Hello"

# Условия


true && false # false
true || false # true
nil && false # nil

greeting = 'Hello'
greeting ||= 'Hi' # greeting = greeting || 'Hi'
print greeting
# => "Hello"

hi ||= 'Hi' # "Hi"

1 == 0 # false
1 != 0 # true

# Функции и методы

# Вызов метода у строки
# 'Hello, World!'.is_a?(Object)
'Hello, World!'.is_a? Object # true
5.is_a? Object # true
true.is_a? Object # true
nil.is_a? Object # true

'Hello, World!'.class # String

print 'Hello, World!'.class.ancestors
# => [String, Comparable, Object, PP::ObjectMixin, Kernel, BasicObject]

print true.class.ancestors
# => [TrueClass, Object, PP::ObjectMixin, Kernel, BasicObject]

print nil.class.ancestors
# => NilClass, Object, PP::ObjectMixin, Kernel, BasicObject

'Hello'.length # 5

'Hello'.empty? # false
''.empty? # true
''.nil? # false
nil.nil? # true

name = 'Alice'
name.upcase # 'ALICE'
print name
# => "Alice"
name.upcase! # 'ALICE'
print name
# => "ALICE"

0.nil? # false
0.zero? # true
2.positive? #true
2.negative? # false
8.even? # true
8.odd? # false


def greeting
  print 'Hello, World!'
end

def show_greeting(name)
  print "Hello, #{name}!"
end

def show_greeting(name = 'Alice')
  print "Hello, #{name}!"
end

def show_greeting(name:)
  print "Hello, #{name}!"
end

show_greeting(name: 'Alice')

def show_greeting(name: 'Alice')
  print "Hello, #{name}!"
end

show_greeting()

def green?(color)
  color == 'green'
end

green? 'red' # false
green? 'green' # true

def make_green=(color)
  color = 'green'
end

def format_string!(string)
  string.uppercase!
end

# Конструкции

a = 1

if a.positive?
  print 'positive'
elsif a.negative?
  print 'negative'
elsif a.zero?
  print 'zero'
else
  print 'unknown'
end

unless 1 == 5 # unless = !if
  # ...
end

# Guard Clause
return if a.zero?

return unless a.zero?

(a == 1) ? print('one') : print('not one')

# Циклы

counter = 1

# пока условие выполняется
while counter < 5 do
  counter += 1
  print counter
end


counter = 10

# пока условие не выполняется
until counter > 5 do
  counter += 1
  print counter
end

array = [1, 2, 3, 4, 5]

for number in array do
  print "#{number},"
end

counter = 1

# break
# вернёт nil
loop do
  counter += 1
  break if counter == 5
end

# break
# вернёт counter
loop do
  counter += 1
  break counter if counter == 5
end

# case
color = 'red'

case color
when 'green'
  print 'green'
when 'red'
  print 'red'
else
  print 'other'
end

case color
when 'green' then print 'green'
when 'red' then print 'red'
else print 'other'
end

# Модули

# solution.rb
module Solution
  def find_average(a, b)
    (a + b) / 2
  end
end

# run.rb
# require - относительно root директории полный путь)
# относительно текущей директории (относительный путь)
require_relative 'solution'
# include - служебное слово для использования методов модуля

include Solution
print find_average(5, 11)


ruby run.rb

# Выводит строку и возвращает nil
print 'Hello' # nil
# => 'Hello'

# Выводит строку и возвращает nil
puts 'Hello' # nil
# => "Hello\n"

# Выводит строку и возвращает аргумент
p 'Hello' # "Hello"
# => "Hello\n"

# pretty print
# Удобного для вывода больших структур
pp ({key1: 'value', key2: 'value2', key3: :value3})
# => {:key1=>"value", :key2=>"value2", :key3=>:value3}
