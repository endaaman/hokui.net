webpack = require 'webpack'
path = require 'path'
ExtractTextPlugin = require 'extract-text-webpack-plugin'
HtmlWebpackPlugin = require 'html-webpack-plugin'

pkg = require '../package.json'

module.exports = (prod)->
    conf = new ->
        @fileName = if prod then '[name]-[hash]' else '[name]'
        @srcDir = path.join __dirname, '../client'
        @destDir = path.join __dirname, if prod then '../dist' else '../dist'
        @defines =
            'process.env.NODE_ENV': JSON.stringify if prod then 'production' else 'development'
        null


    if prod
    else
        @devtool = '#inline-source-map'


    @module =
        loaders: [
            test: /\.coffee$/
            loader: 'coffee!source-map'
        ,
            test: /\.jade$/
            loader: 'jade?self'
        ,
            test: /\.(png|jpe?g|gif)$/
            loader: 'file'
        ,
            test: /\.sass$/
            loader: ExtractTextPlugin.extract 'css!sass?indentedSyntax&sourceMap!autoprefixer'
        ,
            test: /\.css$/
            loader: ExtractTextPlugin.extract 'css?sourceMap'
        ,
            test: /\.(ttf|eot|svg|woff|woff2)(\?v=[0-9]\.[0-9]\.[0-9])?$/
            loader: 'file'
        ]


    @resolve =
        extensions: ['', '.js', '.coffee', '.webpack.js', '.web.js']


    @entry =
        app: ["#{conf.srcDir}/index.coffee"]
        # vendor: Object.keys pkg.dependencies


    @output =
        path: conf.destDir
        publicPath: '/'
        filename:  conf.fileName + '.js'
        # chunkFilename: '[id].js'


    @plugins = [
        new webpack.NoErrorsPlugin
        new webpack.DefinePlugin conf.defines
        # new webpack.optimize.CommonsChunkPlugin 'vendor', "#{conf.fileName}.js",
        #     minChunks: Infinity
        new ExtractTextPlugin "#{conf.fileName}.css",
            allChunks: false
        new HtmlWebpackPlugin
            template: "#{conf.srcDir}/index.html"
            favicon: "#{conf.srcDir}/assets/favicon.ico"
            inject: 'body'
    ]
    if prod
        @plugins = @plugins.concat [
            new webpack.optimize.UglifyJsPlugin
                compress:
                    warnings: false
        ]


    if not prod
        @devServer =
            contentBase: conf.destDir
            noInfo: true
            hot: false
            lazy: false
            inline: true
            historyApiFallback: true
            stats:
                colors: true
            proxy:
                '/contents/*': 'http://localhost:3000'
                '/api/*': 'http://localhost:3000'

    null
