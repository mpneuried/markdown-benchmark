examples = require( "../lib/examples" )

testFn = ( parseFn )->
	return ->
		for expl in examples
			parseFn(expl)
		return

module.exports =
	name: 'Multiple sources',
	tests: require( "../lib/test" )( testFn )
