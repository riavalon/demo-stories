var path = require('path');


module.exports = {
  entry: {

    popup: [
      './src/Popup/index.js',
    ],

    content: [
      './src/Content/index.js',
    ],

    wizard: [
      './src/Wizard/index.js',
    ],

  },

  output: {
    path: path.resolve(__dirname + '/dist'),
    filename: 'js/[name].js',
  },

  module: {
    rules: [
      {
        test: /\.elm$/,
        exclude: [/node_modules/, /elm-stuff/],
        loader: 'elm-webpack-loader?verbose=true&warn=true',
        options: {
          pathToMake: '/usr/local/bin/elm-make',
        },
      },

      {
        test: /\.js$/,
        exclude: [/node_modules/, /elm-stuff/],
        loader: 'babel-loader',
      },

      {
        test: /\.(html|json|png)$/,
        exclude: [/node_modules/, /elm-stuff/],
        loader: 'file-loader?name=[name].[ext]',
      },

      {
        test: /\.scss$/,
        exclude: /node_modules/,
        use: [{
            loader: 'style-loader',
          }, {
            loader: 'css-loader',
          }, {
            loader: 'sass-loader',
          }
        ]
      },
    ],
  },

  devServer: {
    inline: true,
    stats: {
      colors: true,
    },
  },

  devtool: 'eval',
};
