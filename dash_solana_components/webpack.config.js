const path = require('path');
const webpack = require('webpack');

const packagejson = require('./package.json');

const dashLibraryName = packagejson.name.replace(/-/g, '_');

module.exports = function (env, argv) {
    const mode = (argv && argv.mode) || 'production';
    const entry = [path.join(__dirname, 'src/ts/index.ts')];
    const output = {
        path: path.join(__dirname, dashLibraryName),
        filename: `${dashLibraryName}.js`,
        library: dashLibraryName,
        libraryTarget: 'umd',
    }

    const externals = {
        react: {
            commonjs: 'react',
            commonjs2: 'react',
            amd: 'react',
            umd: 'react',
            root: 'React',
        },
        'react-dom': {
            commonjs: 'react-dom',
            commonjs2: 'react-dom',
            amd: 'react-dom',
            umd: 'react-dom',
            root: 'ReactDOM',
        },
    };

    return {
        output,
        mode,
        entry,
        target: 'web',
        externals,
        resolve: {
            extensions: ['.ts', '.tsx', '.js', '.jsx', '.json'],
            fallback: {
              "stream": require.resolve("stream-browserify"), // Used for 'stream'
              "crypto": require.resolve("crypto-browserify"), // Used for 'crypto'
              "http": require.resolve("stream-http"), // Used for 'http'
              "https": require.resolve("https-browserify"), // Used for 'https'
              "assert": require.resolve("assert"), // Used for 'assert'
              "url": require.resolve("url/"),
              "zlib": require.resolve("browserify-zlib"),
              "buffer": require.resolve("buffer/"),
            },
        },
        plugins: [
            new webpack.ProvidePlugin({
                Buffer: ['buffer', 'Buffer'], // Add this line
            }),
        ],
        module: {
            rules: [
                {
                    test: /\.tsx?$/,
                    use: 'ts-loader',
                    exclude: /node_modules/,
                },
                {
                    test: /\.jsx?$/,
                    exclude: /node_modules/,
                    use: 'babel-loader'
                },
                {
                    test: /\.css$/,
                    use: [
                        {
                            loader: 'style-loader',
                            options: {
                                insert: function insertAtTop(element) {
                                    var parent = document.querySelector("head");
                                    var lastInsertedElement =
                                        window._lastElementInsertedByStyleLoader;

                                    if (!lastInsertedElement) {
                                        parent.insertBefore(element, parent.firstChild);
                                    } else if (lastInsertedElement.nextSibling) {
                                        parent.insertBefore(element, lastInsertedElement.nextSibling);
                                    } else {
                                        parent.appendChild(element);
                                    }

                                    window._lastElementInsertedByStyleLoader = element;
                                },
                            },
                        },
                        {
                            loader: 'css-loader',
                        },
                    ],
                },
            ]
        }
    }
}
