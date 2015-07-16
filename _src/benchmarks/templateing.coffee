testData = require( "../data.json" )
template = require( "../lib/template" )

testFn = ( parseFn )->
	return ->
		contents = []
		for test in testData
			contents.push parseFn(test.md)
			
		template( contents )
		return

tests = require( "../lib/test" )( testFn )

tests.push
	name: "Pre-converted to HTML"
	fn: ->
		contents = []
		for test in testData
			contents.push test.html
			
		template( contents )
		return
		

module.exports =
	name: 'Used within templateing',
	tests: tests
