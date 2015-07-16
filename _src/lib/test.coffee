parsers = require( "../lib/parsers" )

module.exports = ( testFn )->
	tests = []
	for parser in parsers
		tests.push
			name: parser.name
			fn: testFn( parser.parse, parser.name )
	return tests
