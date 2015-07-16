fs = require( "fs" )
path = require( "path" )

examples = require( "../lib/examples" )
marked = require('marked')

targetfile = "/../data.json"

resultJSON = []
for example in examples
	resultJSON.push
		md: example
		html: marked( example )

_targetPath = path.resolve( __dirname + targetfile )
console.log "write to #{_targetPath}"
fs.writeFileSync( _targetPath, JSON.stringify( resultJSON, true, "\t" ) )
