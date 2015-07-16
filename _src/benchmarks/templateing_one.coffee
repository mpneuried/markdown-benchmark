testData = require( "../data.json" )
template = require( "../lib/template" )

testFn = ( parseFn )->
	return ->
		contents = []
		contents.push parseFn(testData[0].md)
			
		template( contents )
		return

tests = require( "../lib/test" )( testFn )

tests.push
	name: "Pre-converted to HTML"
	fn: ->
		contents = []
		contents.push testData[0].html
			
		template( contents )
		return
		

module.exports =
	name: 'Used within templateing and only one parse',
	tests: tests
