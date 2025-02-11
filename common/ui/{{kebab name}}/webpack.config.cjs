const path = require('path');
const packageJson = require('./package.json');

module.exports = (env) => ({
    devtool: env.MODE === 'development' ? 'inline-source-map' : 'source-map',
    mode: env.MODE || 'production',
    entry: './src/app.tsx',
    output: {
        filename: '{{name}}-app.js', // '[name].[contenthash].bundle.js',
        libraryTarget: 'system',
        path: path.resolve(__dirname, 'build', process.env.OUTDIR || ''),
        publicPath: process.env.BASE_PATH
    },
    externals: ['react', 'react-dom'],
    resolve: {
        extensions: ['.js', '.jsx', '.json', '.ts', '.tsx']
    },
    devServer: {
        hot: true,
        client: {
            overlay: {
                warnings: false,
                errors: true
            }
        },
        host: '0.0.0.0',
        port: '{{debugPort}}',
        headers: {
            'Access-Control-Allow-Origin': '*',
            'Access-Control-Allow-Methods': 'GET, POST, PUT, DELETE, PATCH, OPTIONS',
            'Access-Control-Allow-Headers': 'X-Requested-With, content-type, Authorization'
        },

        historyApiFallback: true
    },

    module: {
        rules: [
            {
                test: /\.tsx?$/,
                use: 'ts-loader',
                exclude: /node_modules/
            },
            {
                test: /\.(jsx?)$/,
                exclude: /node_modules/,
                use: ['babel-loader']
            },
            {
                test: /\.svg$/,
                exclude: /node_modules/,
                use: ['@svgr/webpack']
            },
            {
                test: /\.(png|jpe?g|gif|eot|woff2?|ttf)$/i,
                exclude: [
                    path.resolve(__dirname, 'node_modules/@fortawesome/fontawesome-free/svgs')
                ],
                use: [
                    {
                        loader: 'file-loader'
                    }
                ]
            },
            {
                test: /\.html?$/i,
                use: ['html-loader']
            },
            {
                test: /\.css$/,
                use: [
                    'style-loader',
                    {
                        loader: 'css-loader',
                        options: {
                            modules: {
                                localIdentName: '[path][name]__[local]'
                            }
                        }
                    }
                ]
            }
        ]
    }
});
