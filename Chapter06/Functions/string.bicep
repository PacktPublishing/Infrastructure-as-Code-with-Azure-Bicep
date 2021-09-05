//base64
output base64Output string = base64('one, two, three') // b25lLCB0d28sIHRocmVl

//base64ToJson
output toJsonOutput object = base64ToJson('b25lLCB0d28sIHRocmVl') // {"one": "a", "two": "b"}

//base64ToString
output toStringOutput string = base64ToString('b25lLCB0d28sIHRocmVl') //'one, two, three'

//concat
param prefix string = 'prefix'
output concatOutput string = '${prefix}And${uniqueString(resourceGroup().id)}'

//contains
output stringTrue bool = contains('Test', 'e') //true
output stringFalse bool = contains('TEST', 'e') //false

//dataUri
output dataUriOutput string = dataUri('Hello') // data:text/plain;charset=utf8;base64,SGVsbG8=

//dataUriToString
output dataUriToStr string = dataUriToString('data:text/plain;charset=utf8;base64,SGVsbG8=') // Hello

//empty
output stringEmpty bool = empty('') // true

//endsWith
output endsTrue bool = endsWith('abcdef', 'ef') // true

//first
output firstChar string = first('Yas') // Y

//format
param food string = 'Big Mac'
param calories int = 1300

output formatTest string = format('{0}, contains {2:N0} calories!!!', food, calories)
// Big Mac contains 1,300 calories!!!

//guid
output guidPerSubscription string = guid(subscription().subscriptionId)
output guidPerResourceGroup string = guid(resourceGroup().id)
output guidPerDeployment string = guid(resourceGroup().id, deployment().name)

//indexOf
output firstT int = indexOf('test', 't') // 0
output firstM int = indexOf('test', 't') // -1

//json
param jsonObjectStr string = '{\'a\': \'b\'}'
output objectOutput object = json(jsonObjectStr) // { 'a': 'b' }

//last
output lastChar string = last('test') // 't'

//lastIndexof
output lastT int = lastIndexOf('test', 't') // 3

//length
output stringLength int = length('test') // 4

//newGuid
param guidValue string = newGuid()
output guidOutput string = guidValue

//padLeft
output rightAlignedStr string = padLeft('12', 5, '0') // 00012

//replace
output secondOutput string = replace('123-1234-234', '1234', 'xxxx') // '123-xxxx-234'

//skip
output skippedStr string = skip('James Bond', 6) // 'Bond'

//split
param unsplitString string = 'one;two,three'
var delimiters = [
  ','
  ';'
]
output splittedStringArray array = split(unsplitString, delimiters) // ['one', 'two', 'three']

//startsWith
output startsTrue bool = startsWith('JaMeS', 'JA') // true
output startsFalse bool = startsWith('abcdef', 'ef') // false

//string
output intOutput string = string(5) // '5'
var numberArray = [
  '1'
]
output arrayOutput string = string(numberArray) // '['1']'

//substring
output substringOutput string = substring('Bond, James Bond', 6, 5) // 'James'

//take
output takeOutput string = take('James Bond', 5) // 'James'

//toLower
output toLowerOutput string = toLower('James Bond') // 'james bond'

//toUpper
output toUpperOutput string = toUpper('James Bond') // 'JAMES BOND'

//trim
output return string = trim('   James   ') // 'James'

//uniqueString
resource stg 'Microsoft.Storage/storageAccounts@2018-07-01' = {
  name: 'storage${uniqueString(resourceGroup().id)}'
  location: resourceGroup().location
  kind: 'StorageV2'
  sku: {
    name: 'Premium_LRS'
  }
}
output storageName string = stg.name

//uri
var uri1 = uri('http://contoso.org/firstpath', 'myscript.sh')
var uri2 = uri('http://contoso.org/firstpath/', 'myscript.sh')
var uri3 = uri('http://contoso.org/firstpath/azuredeploy.json', 'myscript.sh')
var uri4 = uri('http://contoso.org/firstpath/azuredeploy.json/', 'myscript.sh')

output withoutTrailingSlash string = uri1 // http://contoso.org/myscript.sh
output withSlash string = uri2 // http://contoso.org/firstpath/myscript.sh
output lastSlash string = uri3 // http://contoso.org/firstpath/myscript.sh
output lastSlashWithPart string = uri4 // http://contoso.org/firstpath/azuredeploy.json/myscript.sh

//uriComponent
output uriEncoded string = uriComponent(uri1) // http%3A%2F%2Fcontoso.org%2Fmyscript.sh

//uriComponentToString
output stringComponent string = uriComponentToString('http%3A%2F%2Fcontoso.org%2Fmyscript.sh') // 'http://contoso.org/myscript.sh'
