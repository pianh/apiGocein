var Express = require("express");
var bodyParser = require("body-parser");

var app = Express();
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended:true}));

var cors = require('cors')
app.use(cors())

const mysql = require('mysql');
var connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password:'',
    database:'gocein'
})

var fileUpload = require('express-fileupload');
var fs = require('fs');
app.use(fileUpload());
app.use('/Photos', Express.static(__dirname+'/Photos'));

app.listen(8080, ()=>{
    connection.connect(function(err){
        if(err) throw err;
        console.log('Connected to DB');
    });
});


const { request } = require("http");

app.use('/Photos',Express.static(__dirname+'/Photos'))

app.get('/', (request, response)=> {
    response.send('Hello world')
})

// Type
app.get('/api/producttype',(request, response)=>{
    var query=`SELECT * from ProductType`;
    connection.query(query, function(err, rows, fields){
        if(err){
            response.send('Failed');
        }
        response.send(rows);
    })
})


app.post('/api/producttype', (request, response) => {
    var query = `INSERT INTO producttype 
    (ProductTypeName, CreateAt, UpdateAt ) 
    VALUES (?, now(), now())`;
    var values = [
        request.body['ProductTypeName'],
        request.body['CreateAt'],
        request.body['UpdateAt'],
    ];
    // Kiểm tra và chuyển đổi giá trị undefined thành null
    values = values.map(value => (typeof value === 'undefined' ? null : value));
    connection.query(query, values, function(err, rows, fields) {
        if (err) {
            response.send('Failed');
        } else {
            response.json('Thêm loại sản phẩm thành công');
        }
    });
});


app.put('/api/producttype', (request, response) => {
    var query = `UPDATE producttype SET ProductTypeName=?, UpdateAt=now() WHERE ProductTypeId=?`;
    var values = [
        request.body['ProductTypeName'],
        request.body['ProductTypeId'],
    ];
    // Kiểm tra và chuyển đổi giá trị undefined thành null
    // values = values.map(value => (typeof value === 'undefined' ? null : value));
    connection.query(query, values, function(err, rows, fields) {
        if (err) {
            response.send('Failed');
        } else {
            response.json('Cập nhật loại sản phẩm thành công');
        }
    });
});



app.delete('/api/producttype/:id', (request, response) => {
    var query = `DELETE FROM producttype WHERE ProductTypeId=?`;
    var values = [
        parseInt(request.params.id)
    ];
    connection.query(query, values, function(err, rows, fields) {
        if (err) {
            response.send('Failed');
        } else {
            response.json('Xóa loại sản phẩm thành công');
        }
    });
});




// Product

app.get('/api/product',(request, response)=>{
    var query=`SELECT * from Product`;
    connection.query(query, function(err, rows, fields){
        if(err){
            response.send('Failed');
        }
        response.send(rows);
    })
})

// API Thong Ke Tong So San Pham
app.get('/api/product/count', (request, response) => {
    var query = `SELECT COUNT(*) AS productTotal FROM Product`;
    connection.query(query, function(err, rows, fields){
        if(err){
            response.send('Failed');
        }
        response.send(rows[0]);
    });
});



app.post('/api/product', (request, response) => {
    var query = `INSERT INTO product 
    (ProductName, ProductPrice, ProductType, ProductFileName, CreateAt, UpdateAt ) 
    VALUES (?, ?, ?, ?, now(), now())`;
    var values = [
        request.body['ProductName'],
        request.body['ProductPrice'],
        request.body['ProductType'],
        request.body['ProductFileName'],
        request.body['CreateAt'],
        request.body['UpdateAt'],
    ];
    // Kiểm tra và chuyển đổi giá trị undefined thành null
    values = values.map(value => (typeof value === 'undefined' ? null : value));
    connection.query(query, values, function(err, rows, fields) {
        if (err) {
            response.send('Failed');
        } else {
            response.json('Thêm sản phẩm thành công');
        }
    });
});


app.put('/api/product', (request, response) => {
    var query = `UPDATE product SET ProductName=?, ProductPrice=?, ProductType=?, ProductFileName=?, UpdateAt=now() WHERE ProductId=?`;
    var values = [
        request.body['ProductName'],
        request.body['ProductPrice'],
        request.body['ProductType'],
        request.body['ProductFileName'],
        request.body['ProductId'],
    ];
    // Kiểm tra và chuyển đổi giá trị undefined thành null
    // values = values.map(value => (typeof value === 'undefined' ? null : value));
    connection.query(query, values, function(err, rows, fields) {
        if (err) {
            response.send('Failed');
        } else {
            response.json('Cập nhật sản phẩm thành công');
        }
    });
});



app.delete('/api/product/:id', (request, response) => {
    var query = `DELETE FROM product WHERE ProductId=?`;
    var values = [
        parseInt(request.params.id)
    ];
    connection.query(query, values, function(err, rows, fields) {
        if (err) {
            response.send('Failed');
        } else {
            response.json('Xóa sản phẩm thành công');
        }
    });
});


app.post('/api/product/savefile', (request, response) => {
    if (!request.files || !request.files.file) {
        // Kiểm tra xem có tệp tin đã được gửi hay không
        response.status(400).json('Vui lòng đính kèm tệp');
        return;
    }

    fs.writeFile("./Photos/" + request.files.file.name, request.files.file.data, function(err) {
        if (err) {
            console.log(err);
            response.status(500).json('Upload file thất bại');
        } else {
            response.json(request.files.file.name);
        }
    });
});