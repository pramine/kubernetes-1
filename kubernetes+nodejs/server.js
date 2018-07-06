var http = require('http');

var server = http.createServer(function(req, res) {
res.writeHead(200, {"Content-Type": "text/html"});
res.end('<p><strong>My Sample NodeJs App</strong>!</p>');
});
server.listen(2000);