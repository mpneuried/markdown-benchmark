sourceMarkdown = require( "../lib/oneexample" )

testFn = ( parseFn )->
	return ->
		parseFn(sourceMarkdown)
		return

module.exports =
	name: 'Single Markdown',
	tests: require( "../lib/test" )( testFn )
