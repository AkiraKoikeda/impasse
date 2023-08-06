const { environment } = require('@rails/webpacker')

module.exports = environment

const webpack = require('webpack')
enviroment.plugin.prepend(
  'Provide',
  new webpack.PovidePlugin({
    $: 'jquery/src/jquery',
    jQuery: 'jquery/src/jquery',
    Popper: 'popper.js'
  })
)