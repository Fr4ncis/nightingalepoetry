// Gruntfile.js
module.exports = function(grunt) {
    // Project configuration.
    grunt.initConfig({
        pkg: grunt.file.readJSON('package.json'),
        assemble: {
            options: {
                layout: "src/layouts/default.hbs",
                flatten: true
            },
            pages: {
                files: {
                    'web/': ['src/pages/*.hbs']
                }
            }
        }
    });
    grunt.loadNpmTasks('assemble');
    grunt.registerTask('default', ['assemble']);
};