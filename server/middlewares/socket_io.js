module.exports = (app, io, db) => {
    io.on('connection', function (socket) {
        console.log("🚀 ~ file: index.js ~ line 32 ~ io.on ~ socket", socket.id)

        socket.on('connect', function () {
            console.log('a user connected');
        })

        socket.on('_getUsers', ({ senderEmail }) => {
            console.log("🚀 ~ file: socket_io.js ~ line 12 ~ socket.on ~ senderEmail", senderEmail)
        })
    });

}