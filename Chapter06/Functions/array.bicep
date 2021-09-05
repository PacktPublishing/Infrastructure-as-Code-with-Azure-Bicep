var fruits = [
  'orange'
  'apple'
]

var smoothies = [
  'pineapple'
  'mango'
]

var person = {
  'name': 'James'
  'lastName': 'Bond'
}

//array
output intOutput array = array(1) // [1]
output stringOutput array = array('test') // ["test"]
output objectOutput array = array({
  'name': 'John'
  'lastName': 'Doe'
}) // [{"name": "John", "lastName": "Doe"}]

//concat
output concatanatedArray array = concat(fruits, smoothies) // ["orange", "apple", "pineapple", "mango"]

//contains
output stringTrue bool = contains('test', 'e') // true
output objectTrue bool = contains(person, 'name') // true
output arrayFalse bool = contains(fruits, 'banana') // false

//empty
output arrayEmpty bool = empty([]) // true
output objectEmpty bool = empty({}) // true
output stringEmpty bool = empty('') // true

//first
output arrayFirst string = first(fruits) // 'orange'
output stringFirst string = first('Test') // 'T

//intersection

var fastFood = [
  'burger'
  'ham & cheese'
  'falafel'
]

var food = [
  'burger'
  'steak'
]

output commonFood array = intersection(fastFood, food) // ['burger']

//last
output lastArray string = last(food) // 'steak'
output lastString string = last('One') // 'e'

//lenght
var obj = {
  'propA': 'one'
  'propB': 'two'
  'propC': 'three'
  'propD': {
    'propD-1': 'sub'
    'propD-2': 'sub'
  }
}
output arrayLength int = length(food) // 2
output stringLength int = length('Test') // 4
output objectLength int = length(obj) // 4

//max
output maxArray int = max([
  0
  1
  2
]) // 2
output maxInt int = max(0, 3, 2, 5, 4) // 4

//min
output minArray int = max([
  0
  1
  2
]) // 0
output minInt int = max(0, 3, 2, 5, 4) // 0

//range
output rangeOutput array = range(5, 3) // [5, 6, 7]

//skip
output skippedArray array = skip(fastFood, 2) // ['falafel']
output skippedStr string = skip('Test', 1) // 'est'

//take
output takeArray array = take(fastFood, 1) // ['burger']
output takeStr string = take('Test', 2) // 'Te'

//union
output unionArray array = union(fastFood, food) // ['burger', 'ham & cheese', 'falafel', 'steak']
var one = {
  'one': '1'
}
var two = {
  'two': '2'
}
output unionStr object = union(one, two) // {'one':'1', 'two':'2'}
