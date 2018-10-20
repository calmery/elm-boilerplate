const HtmlWebpackPlugin = require("html-webpack-plugin");
const CopyWebpackPlugin = require("copy-webpack-plugin");
const WriteFilePlugin = require("write-file-webpack-plugin");

const mode = (() => {
  switch (process.env.NODE_ENV) {
    case "production":
    case "development":
      return process.env.NODE_ENV;
    default:
      return "development";
  }
})();

module.exports = {
  entry: `${__dirname}/src/entry.js`,
  mode,
  module: {
    rules: [
      {
        test: /\.scss$/,
        loader: ["style-loader", "css-loader?url=false", "sass-loader"]
      },
      {
        test: /\.elm$/,
        exclude: [/elm-stuff/, /node_modules/],
        use: {
          loader: "elm-webpack-loader",
          options: {
            verbose: true,
            optimize: mode === "production"
          }
        }
      }
    ]
  },
  output: {
    path: `${__dirname}/build/`,
    filename: "index.js"
  },
  plugins: [
    new HtmlWebpackPlugin({
      template: `${__dirname}/src/index.html`,
      minify: {
        collapseWhitespace: mode === "production"
      }
    }),
    new CopyWebpackPlugin([
      { from: `${__dirname}/src/assets`, to: `${__dirname}/build/assets` }
    ]),
    new WriteFilePlugin()
  ]
};
