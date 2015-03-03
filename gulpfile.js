var gulp = require('gulp');
var gutil = require('gulp-util');
var coffee = require('gulp-coffee');

var colors = gutil.colors

gulp.task('coffee', function() {
  gulp.src('./.*.coffee')
    .pipe(coffee({bare: true}).on('error', gutil.log))
    .pipe(gulp.dest('./'))
});

gulp.task('watch', ['coffee'], function() {
  var w = gulp.watch(['./*', './.*', './.*.coffee'], ['coffee']);
  w.on('change', function(event) {
    gutil.log('File', colors.cyan(event.path),
              'was', colors.magenta( event.type));
  });
});

gulp.task('default', ['coffee']);
