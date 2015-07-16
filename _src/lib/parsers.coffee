parsers = []

showdown = require('showdown')
converter = new showdown.Converter()
parsers.push
	name: 'Showdown'
	parse: converter.makeHtml

markdown = require( "markdown" ).markdown
parsers.push
	name: 'markdown-js'
	parse: markdown.toHTML

marked = require('marked')
parsers.push
	name: 'Marked'
	parse: marked

module.exports = parsers
