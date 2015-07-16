fs = require( "fs" )
request = require( "request" )

_url = "http://jaspervdj.be/lorem-markdownum/markdown.txt"

targetfile = "../data.txt"
delimiter = "\n;;;;;;;;;;;;;;;;;;;;\n"

writeStream = fs.createWriteStream( targetfile, {'flags': 'a'} )

collected = []

timeout = process.env.TMO or 500
maxCount = process.env.CNT or 500
currCount = 0

readDataCount = ( cb )->
	fs.readFile targetfile, ( err, file )->
		if err
			cb( err )
			return
		_count = ( file.toString().match(/\n;;;;;;;;;;;;;;;;;;;;\n/g) or [] ).length
		cb( null, _count )
		return
	return

loadMarkdown = ( cb )->
	request.get _url, ( err, resp, body )->
		if err
			cb( err )
			return
		
		if resp.statusCode isnt 200
			cb( body )
			return
		
		writeStream.write( body, "utf8" )
		writeStream.write( delimiter, "utf8" )
		cb()
		return
	return

fnCheck = ( err )->
	next = ->
		setTimeout( fnCheck, timeout )
		return
		
	if err?
		loadMarkdown( next )
		return
	currCount++
	if currCount >= maxCount
		console.log "Got enough markdown examples (count: #{currCount})"
		return
		
	console.log "next ... #{currCount}"
	loadMarkdown( next )
	return
	
# start the script
readDataCount ( err, count )->
	if err
		console.error( err )
		return
	currCount = count
	fnCheck()
	return
