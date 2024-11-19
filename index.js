const express = require('express')
const app = express()
const cors = require('cors')
const mongoose = require('mongoose')
var bodyParser = require('body-parser')
const morgan = require('morgan')
const dotenv = require('dotenv')

app.use(bodyParser.json({limit:"50mb"}));
app.use(cors());
app.use(morgan('common'));

mongoose.connect("mongodb+srv://nvt33018:Nvt33018@tours.0xgsm.mongodb.net/")
    .then(() => {
        // Kết nối thành công, bạn có thể thực hiện các thao tác với database
        console.log("Kết nối thành công!");
    })
    .catch(err => {
        // Xử lý lỗi
        console.error("Kết nối thất bại!", err);
    });

app.listen(8000, () => {
    console.log('Server is running on port 8000')
});