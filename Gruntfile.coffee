module.exports = (grunt) ->
	# Project configuration.
	grunt.initConfig
		pkg: grunt.file.readJSON('package.json')
		regarde:
			module:
				files: ["_src/**/*.coffee"]
				tasks: [ "coffee:changed" ]
			
			dev:
				files: ["_src/**/*.coffee"]
				tasks: [ "coffee:changed", "bench" ]
			
		coffee:
			changed:
				expand: true
				cwd: '_src'
				src:	[ '<% print( _.first( ((typeof grunt !== "undefined" && grunt !== null ? (_ref = grunt.regarde) != null ? _ref.changed : void 0 : void 0) || ["_src/nothing"]) ).slice( "_src/".length ) ) %>' ]
				# template to cut off `_src/` and throw on error on non-regrade call
				# CF: `_.first( grunt?.regarde?.changed or [ "_src/nothing" ] ).slice( "_src/".length )
				dest: ''
				ext: '.js'

			base:
				expand: true
				cwd: '_src',
				src: ["**/*.coffee"]
				dest: ''
				ext: '.js'

		clean:
			base:
				src: [ "*.js", "lib", "benchmarks", "prepare" ]

		
		benchmark:
			all:
				src: [ "benchmarks/*.js" ]
				dest: "results/benchmark.csv"
					
		exec: 
			start_atom:
				command: "atom ."
		

	# Load npm modules
	grunt.loadNpmTasks "grunt-regarde"
	grunt.loadNpmTasks "grunt-contrib-coffee"
	grunt.loadNpmTasks "grunt-contrib-clean"
	grunt.loadNpmTasks "grunt-benchmark"
	grunt.loadNpmTasks "grunt-exec"

	# just a hack until this issue has been fixed: https://github.com/yeoman/grunt-regarde/issues/3
	grunt.option('force', not grunt.option('force'))
	
	# ALIAS TASKS
	grunt.registerTask "watch", "regarde:module"
	grunt.registerTask "default", "build"
	grunt.registerTask "clear", [ "clean:base" ]
	grunt.registerTask "bench", [ "benchmark:all" ]
	grunt.registerTask "dev", [ "exec:start_atom", "build", "bench", "regarde:dev" ]

	# build the project
	grunt.registerTask "build", [ "clear", "coffee:base" ]
	grunt.registerTask "release", [ "clear", "coffee:base", "bench" ]
