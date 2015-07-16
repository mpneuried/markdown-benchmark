module.exports = ( contentList )->
	html = [ "<ul>" ]
	for content in contentList
		html.push "\t<li>"
		html.push "\t" + content
		html.push "\t</li>"
		
	html.push "</ul>"
	
	return html.join( "\n" )
	
