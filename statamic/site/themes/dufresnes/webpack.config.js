const MiniCssExtractPlugin = require("mini-css-extract-plugin");
const path = require("path");

const CSS_ENTRY = path.resolve(__dirname, "src/sass/redwood.scss");
const JS_ENTRY = path.resolve(__dirname, "src/js/main.js");

const CSS_OUT = "css/dufresnes";
const JS_OUT = "js/dufresnes";

module.exports = {
  entry: {
    [CSS_OUT]: CSS_ENTRY,
    [JS_OUT]: JS_ENTRY
  },
  output: {
    path: path.resolve(__dirname)
  },
  module: {
    rules: [
      {
        test: /\.(sa|sc|c)ss$/,
        use: [
          {
            loader: MiniCssExtractPlugin.loader,
            options: {
              hmr: process.env.NODE_ENV === "development"
            }
          },
          "css-loader",
          "sass-loader"
        ]
      }
    ]
  },
  plugins: [
    new MiniCssExtractPlugin({
      filename: "css/dufresnes.css"
    })
  ]
};
