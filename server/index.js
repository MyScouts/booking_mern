let { PORT } = require('./configs/serverConfig')
let express = require('express')
let logger = require('morgan')
let mongooseConnection = require('./configs/database')
let http = require('http')
let cors = require('cors')
let authRouter = require('./routers/auth')
let userRouter = require('./routers/user')
let conversationRouter = require('./routers/conversation')
let messageRouter = require('./routers/message')
let friendsRouter = require('./routers/friend')
let customerRouter = require('./routers/customer')
let productRouter = require('./routers/product')
let categoryRouter = require('./routers/category')

// 
mongooseConnection()
let app = express()
let serverApp = http.createServer(app)
let io = require('socket.io')(serverApp)
require('./middlewares/socket_io')(app, io, null)
// Middleware
app.use(logger('dev'))
app.use(express.json())
app.use(cors());
app.use(function (req, res, next) {
    res.header('Origin', "*")
    res.header("Access-Control-Allow-Origin", "*");
    res.header('Access-Control-Allow-Methods', 'DELETE, PUT, GET, POST');
    res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
    next();
});


// Route
app.use("/api/auth", authRouter)
app.use("/api/user", userRouter)
app.use("/api/conversation", conversationRouter)
app.use("/api/message", messageRouter)
app.use("/api/friends", friendsRouter)
app.use("/api/customers", customerRouter)
app.use("/api/products", productRouter)
app.use("/api/categories", categoryRouter)
// Catch 404 Errors and forward them to error controller
app.use((req, res, next) => {
    let err = new Error("Not Found!")
    err.status = 404
    next(err)
})

// error handle function    
app.use((err, req, res, next) => {
    let error = app.get('env') === 'development' ? err : {}
    let status = err.status || 500

    // response to client
    return res.status(status).json({
        error: {
            message: error.message
        }
    })
})



// Start server
serverApp.listen(PORT, () => console.log(`Server is listening on port ${PORT}`))


