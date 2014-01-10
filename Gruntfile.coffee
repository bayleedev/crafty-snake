module.exports = (grunt) ->
  grunt.loadNpmTasks "grunt-contrib-copy"
  grunt.loadNpmTasks "grunt-css"
  grunt.loadNpmTasks "grunt-contrib-uglify"
  grunt.loadNpmTasks "grunt-contrib-less"
  grunt.loadNpmTasks "grunt-contrib-coffee"
  grunt.loadNpmTasks "grunt-contrib-clean"
  grunt.loadNpmTasks "grunt-contrib-watch"
  grunt.loadNpmTasks "grunt-html-build"

  ###
  Copys images, compiles coffee, compiles less,
  and creates the html page.
  ###
  grunt.registerTask "build", [
    "clean:build",
    "copy:img",
    "copy:js",
    "copy:css",
    "coffee:build",
    "less:build",
    "htmlbuild:build",
  ]

  ###
  Production build also compiles all styles and
  scripts to a single file and minifies.
  ###
  grunt.registerTask "build:production", [
    "clean:build",
    "copy:img",
    "copy:js",
    "copy:css",
    "coffee:compile",
    "less:build",
    "uglify:build",
    "cssmin:build",
    "clean:jsmin",
    "clean:cssmin",
    "htmlbuild:build",
  ]

  ###
  Does a development build, then watches for changes.
  ###
  grunt.registerTask "build:watch", [
    "build",
    "watch",
  ]

  grunt.initConfig
    watch:
      dev:
        files: ["src/**/*"]
        tasks: ["build"]

    clean:
      build:
        src: ["build/**/*"]
        options:
          "no-write": false
      jsmin:
        src: ["build/**/*.js", "!build/**/*.min.js"]
        options:
          "no-write": false
      cssmin:
        src: ["build/**/*.css", "!build/**/*.min.css"]
        options:
          "no-write": false

    copy:
      img:
        files: [
          cwd: "./src/assets/img/"
          expand: true
          flatten: false
          src: ["**/*"]
          dest: "build/img"
          filter: "isFile"
        ]
      css:
        files: [
          cwd: "src/assets/css/"
          expand: true
          flatten: false
          src: ["**/*.css"]
          dest: "build/css"
          filter: "isFile"
        ]
      js:
        files: [
          cwd: "src/assets/js/"
          expand: true
          flatten: false
          src: ["**/*.js"]
          dest: "build/js"
          filter: "isFile"
        ]

    less:
      build:
        files:
          # Put CSS manifests here
          "build/css/main.css": ["src/assets/css/main.less"]

    coffee:
      build:
        files: [
          expand: true
          cwd: "src/assets/js/"
          src: ["**/*.coffee"]
          dest: "build/js/"
          ext: ".js"
        ]
      compile:
        files:
          "build/js/app.js": ["src/assets/js/**/*.coffee"]

    cssmin:
      build:
        files: [
          expand: true
          cwd: "build/css/"
          src: ["**/*.css"]
          dest: "build/css/"
          ext: ".min.css"
        ]

    uglify:
      build:
        files: [
          'build/js/app.min.js': ['build/js/**/*.js'],
        ]

    htmlbuild:
      build:
        src: "src/index.html"
        dest: "build/"
        options:
          scripts:
            bundle: ["build/js/vendor/**/*.js", "build/js/**/*.js"]
          styles:
            bundle: ["build/css/**/*.css"]
