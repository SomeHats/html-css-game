require! {
  'gulp'
  'yargs': {argv}
  'require-dir'
  'git-rev'
  'bluebird': Promise
}

global.optimized = argv.o or argv.optimized or argv.optimised or false
global.production = argv.p or argv.production or false
if global.production then global.optimized = true
console.log global.{optimized, production}

global.eak-version = new Promise (resolve, reject) ->
  tag <- git-rev.tag!
  branch <- git-rev.branch!
  hash <- git-rev.short!

  version = "#{tag}-#{branch}-#{hash}".replace /[^a-z0-9_\-\.]/ig, '-'
  resolve version

global.languages = ['en']
global.default-lang = 'en'
try
  if production
    global.config = require './conf.prod.js'
  else
    global.config = require './conf.dev.js'
catch e
  console.log 'Error loading config' e
  global.config = {}

global.src = {
  assets: './app/assets/**/*'
  audio: './app/audio/**/*.{mp3,ogg,wav}'
  audio-cache: './gulp-cache/audio/**/*'
  areas: './app/l10n-templates/areas/*/area.json'
  bgs: './app/assets/content/bgs/**/*.png'
  bg-cache: './gulp-cache/bgs/**/*.png'
  bg-tile-cache: './gulp-cache/bg-tiles/**/*.png'
  bg-tile-min-cache: './gulp-cache/bg-tiles-min/**/*.png'
  created-bundles: 'public/**/*.eakpackage'
  bundles: './public/**/bundle.txt'
  css-all: './app/styles/**/*.styl'
  css: ['./app/styles/app.styl', './app/styles/min.styl']
  entity-assets: './app/{entities,minigames}/**/*.{png,jpg,gif,json,txt}'
  entity-scripts: './app/{entities,minigames}/**/*.ls'
  entity-styles: './app/{entities,minigames}/**/*.styl'
  fonts: './bower_components/font-awesome/fonts/*'
  hbs: './app/scripts/**/*.hbs'
  locale-data: './locales/**/*.json'
  locale-templates: './app/l10n-templates/**/*'
  lsc: './app/scripts/**/*.ls'
  minigames: './app/minigames'
  tests: './test/**/*.ls'
  vendor: ['./vendor/*.js' './vendor/rework/rework.js', './vendor/slowparse/slowparse.js']
  workers-static: ['./bower_components/underscore/underscore.js'
                   './app/workers/**/*.js'
                   './vendor/require.js']
  workers: './app/workers/**/*.ls'
}

global.dest = {
  all: './public/'
  assets: './public'
  audio-cache: './gulp-cache/audio'
  audio: './public/audio'
  bg-cache: './gulp-cache/bgs'
  bg-tile-cache: './gulp-cache/bg-tiles'
  bg-tile-min-cache: './gulp-cache/bg-tiles-min'
  bg-tiles: './public/content/bg-tiles'
  bundles: './public/'
  cache: './gulp-cache/'
  css: './public/css'
  data: './public/data'
  entities: './public/'
  fonts: './public/fonts'
  js: './public/js'
  minigames: './public/minigames'
  tests: './.test'
  vendor: './public/lib'
}

gulp.task 'default' <[dev]>

require-dir './tasks'
