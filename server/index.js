const app = require("express")();
const httpServer = require("http").createServer(app);
const PORT = process.env.PORT || 5000;
const options = {
    cors: {
        origin: "*", // delete when go online
    },
};
const io = require("socket.io")(httpServer, options);

app.get('/', (req, res) => {
    res.render('home');
});

io.on("connection", socket => { 
    console.log(socket.id);
    let room;

    socket.on('StationID', (id) => {
        console.log('StationID: ' + id);
        if(id == '1cjhs821adlkjd112')
            room = 'Room1';
        else
            room = 'Room2';
        
        socket.join(room);
    });

    socket.on('chat message', (msg) => {
        console.log('message: ' + msg);
        io.to(room).emit('chat message', msg);
    });

    socket.on('disconnect', () => {
        console.log('user disconnected');
    });
});

httpServer.listen(PORT, () => {
    console.log(`listening on *: ${PORT}`);
});