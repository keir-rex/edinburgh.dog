"use strict"

module.exports = (grunt) ->
  grunt.loadNpmTasks "grunt-bower-task"
  grunt.loadNpmTasks "grunt-contrib-connect"
  grunt.loadNpmTasks "grunt-contrib-copy"
  grunt.loadNpmTasks "grunt-contrib-watch"
  grunt.loadNpmTasks "grunt-exec"

  grunt.initConfig

    copy:
      jquery:
        files: [{
          expand: true
          cwd: "bower_components/jquery/dist/"
          src: "jquery.min.js"
          dest: "3rdparty/js/"
        }]
      eventEmitter:
        files: [{
          expand: true
          cwd: "bower_components/eventEmitter/"
          src: "EventEmitter.js"
          dest: "3rdparty/js/"
        }]
      eventie:
        files: [{
          expand: true
          cwd: "bower_components/eventie/"
          src: "eventie.js"
          dest: "3rdparty/js/"
        }]
      imagesloaded:
        files: [{
          expand: true
          cwd: "bower_components/imagesloaded/"
          src: "imagesloaded.js"
          dest: "3rdparty/js/"
        }]
      enquire:
        files: [{
          expand: true
          cwd: "bower_components/enquire/dist/"
          src: "enquire.min.js"
          dest: "3rdparty/js/"
        }]
      skrollr:
        files: [{
          expand: true
          cwd: "bower_components/skrollr/dist/"
          src: "skrollr.min.js"
          dest: "3rdparty/js/"
        }]
      modernizr:
        files: [{
          expand: true
          cwd: "bower_components/modernizr/"
          src: "modernizr.js"
          dest: "3rdparty/js/"
        }]
      normalize:
        files: [{
          expand: true
          cwd: "bower_components/normalize.css/"
          src: "normalize.css"
          dest: "3rdparty/css/"
        }]
      favicons:
        files: [{
          expand: true
          cwd: "favicons/"
          src: "*"
          dest: "_site/"
        }]
    exec:
      jekyll:
        cmd: "jekyll build --trace"

    watch:
      options:
        livereload: true
      source:
        files: [
          "_drafts/**/*"
          "_includes/**/*"
          "_layouts/**/*"
          "_posts/**/*"
          "css/**/*"
          "js/**/*"
          "_config.yml"
          "*.html"
          "*.md"
        ]
        tasks: [
          "exec:jekyll"
        ]

    connect:
      server:
        options:
          port: 4000
          base: '_site'
          livereload: true


  grunt.registerTask "build", [
    "copy"
    "exec:jekyll"
    "copy:favicons"
  ]

  grunt.registerTask "serve", [
    "build"
    "connect:server"
    "watch"
  ]

  grunt.registerTask "default", [
    "serve"
  ]
