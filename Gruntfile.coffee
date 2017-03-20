#global module:false

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
      bootstrap:
        files: [{
          expand: true
          cwd: "bower_components/bootstrap/dist/css/"
          src: "bootstrap.min.css"
          dest: "3rdparty/css/"
        },
        {
          expand: true
          cwd: "bower_components/bootstrap/dist/js/"
          src: "bootstrap.min.js"
          dest: "3rdparty/js/"
        }]
      tether:
        files: [{
          expand: true
          cwd: "bower_components/tether/dist/css/"
          src: "tether.min.css"
          dest: "3rdparty/css/"
        },
        {
          expand: true
          cwd: "bower_components/tether/dist/js/"
          src: "tether.min.js"
          dest: "3rdparty/js/"
        }]
      font_awesome:
        files: [{
          expand: true
          cwd: "bower_components/font-awesome/css/"
          src: "font-awesome.min.css"
          dest: "3rdparty/css/"
        },{
          expand: true
          cwd: "bower_components/font-awesome/fonts/"
          src: "*"
          dest: "3rdparty/fonts/"
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
  ]

  grunt.registerTask "serve", [
    "build"
    "connect:server"
    "watch"
  ]

  grunt.registerTask "default", [
    "serve"
  ]
