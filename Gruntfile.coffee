# * matches any number of characters, but not /
# ? matches a signle character, but not /
# ** matches any number of characters, including /,
# as long as it's only thing in a path part
# {} allows for a comma-separated list of "or" expressions
# ! at the beginning of a pattern will negate the match

module.exports = (grunt) ->
  # TODO les liens sous formes de variables
  resources = grunt.file.readJSON 'resources.json'

  # Récupère les confs tasks
  initialization = grunt.file.readJSON 'conf_tasks.json'
  grunt.config.init initialization

  # Register task
  grunt.registerTask 'serve', ->
    if grunt.option 'build'
      grunt.task.run 'buildMode'
    else
      grunt.task.run 'connect:server'
      grunt.task.run 'watch:all'

  grunt.registerTask 'buildMode', null

  grunt.registerTask 'tasktest', ['connect', 'protractor']
  # Load tasks
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-copy'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-wiredep'
  grunt.loadNpmTasks 'grunt-file-blocks'
  grunt.loadNpmTasks 'grunt-contrib-connect'
  grunt.loadNpmTasks 'grunt-jade'
  grunt.loadNpmTasks 'grunt-contrib-jshint'
  grunt.loadNpmTasks 'grunt-coffeelint'
  grunt.loadNpmTasks 'grunt-karma'
  grunt.loadNpmTasks 'grunt-protractor-runner'










  ###
  grunt.initConfig


    pkg : grunt.file.readJSON 'package.json'

    jade:
      html:
        files: {
          './app/' : './dev/index.jade'
        }
        options:
          pretty: true
          client: false
          wrap: false
          compileDebug: true
      base_path: {
        files: {
          'app/partials/' : ['dev/partials/{,*\/}*.jade']
        },
        options: {
          pretty: true
          client: false
          compileDebug: true
          basePath: './dev/partials/'
        }
      }
    copy :
      main :
        files :[
          {
            expand:true
            cwd: resources.dev.assets
            src: ['**', '**\/*.css']
            dest: resources.app.assets
          }
          ]

    coffeelint: jsTasksConf.coffeelint

    jshint: jsTasksConf.jshint

    coffee: jsTasksConf.coffee2js

    connect:
      options:
        hostname: 'localhost'
        livereload: 35729
        port: 3000
      server:
        options:
          base: ['./app', './']
          open: true


    fileblocks:
      todos:
        src:'./app/index.html'
        blocks:
          app:
            src:resources.app.scripts + '{,*\/}*.js'

    watch:
      all:
        files: [
          'Gruntfile.coffee'
          'dev/*.*'
          'dev/**\/{,*\/}*.*'
        ]
        tasks : [
          'jade:html'
          'jade:base_path'
          'wiredep'
          'coffeelint:app'
          'coffee'
          'jshint:all'
          'fileblocks'
        ]
      options:
        livereload: '<%= connect.options.livereload %>'
        reload: false
        debounceDelay: 10
        event: ['changed', 'added', 'deleted']
        atBegin: true

    wiredep:
      task:
        src: resources.app.index
  ###
