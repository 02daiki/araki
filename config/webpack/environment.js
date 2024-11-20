const { environment } = require('@rails/webpacker')

environment.config.set('entry', {
  application: './app/javascript/packs/application.js'  // 正しいパスに修正
})

module.exports = environment
