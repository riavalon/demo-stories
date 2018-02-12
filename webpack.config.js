var path = require('path');


module.exports = {
  entry: {
    app: [ './src/index.js' ],
  },

  output: {
    path: path.resolve(__dirname + '/dist'),
    filename: '[name].js',
  },

  module: {
    rules: [
      {
        test: /\.elm$/,
        exclude: [/node_modules/, /elm_stuff/],
        loader: 'elm-webpack-loader?verbose=true&warn=true'
      },

      {
        test: /\.html$/,
        exclude: /node_modules/,
        loader: 'file-loader?name=[name].[ext]',
      },

      {
        test: /\.(jpg|png|gif)$/,
        exclude: /node_modules/,
        use: [
          {
            loader: 'url-loader',
            options: {
              limit: 8192
            },
          },
        ],
      },

      {
        test: /\.css$/,
        exclude: /node_modules/,
        use: [{
            loader: 'style-loader',
          }, {
            loader: 'css-loader',
          }
        ]
      },

      {
        test: /\.scss$/,
        exclude: /node_modules/,
        loader: 'style-loader!css-loader!sass-loader'
      }
    ],

    noParse: /\.elm$/
  },

  devServer: {
    inline: true,
    stats: {
      colors: true,
    },
  },

  devtool: 'eval',
};
