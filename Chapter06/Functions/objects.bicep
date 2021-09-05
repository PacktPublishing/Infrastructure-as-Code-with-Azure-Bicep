var spy = {
  'name': 'James'
  'lastName': 'Bond'
  'nationality': 'British'
}

var agent = {
  'name': 'Joe'
  'lastName': 'Walley'
  'nationality': 'British'
}

//contain
output containsOutput bool = contains(spy, 'name') // true

//empty
output objectEmpty bool = empty({}) // true
output objectNotEmpty bool = empty(spy) // false

//intersection
output intersect object = intersection(spy, agent) // {'nationality':'British'}

//json
var jsonObject = '{\'name\': \'James\'}'
output objectOutput object = json(jsonObject) // {'name': 'James'}

//length
var spy2 = {
  'name': 'James'
  'lastName': 'Bond'
  'nationality': 'British'
  'extra': {
    'deparetment': 'MI6'
  }
}
output spy2Length int = length(spy2) // 4
output spyLength int = length(spy2) // 3

//union
var spy3 = {
  'extra': {
    'department': 'MI6'
  }
}
output superSpy object = union(spy, spy3)
// { 'name': 'James', 'lastName': 'Bond', 'nationality': 'British', 'extra': { 'deparetment': 'MI6' } }
