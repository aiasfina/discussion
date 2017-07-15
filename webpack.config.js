const path = require('path')

module.exports = {
    entry: './javascripts/index.js',
    output: {
        path: path.resolve(__dirname, './public/assets'),
        filename: 'app.js',
    },
    module: {
        loaders: [{
            test: /\.js$/,
            exclude: /node_modules/,
            loader: 'babel-loader'
        }]
    }
}
  