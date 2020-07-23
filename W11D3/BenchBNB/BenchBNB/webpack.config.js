const path = require('path');

module.exports = {
    context: __dirname,
    entry: './frontend/bench_bnb.jsx', // entry file
    output: {
        path: path.resolve(__dirname, ''), // where to output file to
        filename: 'bundle.js' // output file name(we can call it anything)
    },
    resolve: {
        extensions: ['.js', '.jsx', '*'] // allows us to import these types of files without having specify the extension
    },
    module: {
        rules: [
            {
                test: /\.jsx?$/,
                exclude: /(node_modules)/, // node modules don't need to be transpiled - they are already ready to go
                use: {
                    loader: 'babel-loader', // transpiler
                    query: {
                        presets: ['@babel/env', '@babel/react']
                    }
                },
            }
        ]
    },
    devtool: 'source-map' // lets us see original code/file line from our code base within chrome errors
};






