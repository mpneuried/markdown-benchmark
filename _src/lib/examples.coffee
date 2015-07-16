fs = require( "fs" )
path = require( "path" )
examplesFile = "/../data.txt"
delimiter = "\n;;;;;;;;;;;;;;;;;;;;\n"
console.log path.resolve( __dirname + examplesFile )

file = fs.readFileSync( path.resolve( __dirname + examplesFile ) )
examples = file.toString().split( delimiter )

console.log "examples count", examples.length

module.exports = examples
