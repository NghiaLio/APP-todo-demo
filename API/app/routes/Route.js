const newRouter = require('./ApiRoute')


function route(app){
    app.use('/v1/api', newRouter);
}

module.exports = route;