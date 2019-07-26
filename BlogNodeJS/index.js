// ============================================ Importing module for defining paths ============================================
const path = require('path')

// ============================================ Importing express modules ============================================
const express = require('express')
const expressEdge = require('express-edge')
const app = new express()

// ============================================ Importing module to parse forms ============================================
const bodyParser = require('body-parser')

// ============================================ Importing module for database ============================================
const mongoose = require('mongoose')
// const post = require('./database/models/post')
mongoose.connect('mongodb://localhost/node-js-blog', { useNewUrlParser: true })

// ============================================ Importing module for image upload ============================================
const fileUpload = require('express-fileupload')

// ============================================ Importing Controllers ============================================
const homePageController = require('./controllers/homePage')
const createPostController = require('./controllers/createPost')
const getPostController = require('./controllers/getPost')
const storePostController = require('./controllers/storePost')

// ============================================ Using Middleware ============================================
app.use(fileUpload())

app.use(express.static('public'))
//app.use(express.static(path.join(__dirname,'public')))

app.use(expressEdge)

// For post request - body-parser
app.use(bodyParser.json())
app.use(bodyParser.urlencoded({extended: true}))

// ================ Defining my own middleware ================
const customMiddleware = (req, res, next) => {
    console.log("customMiddleware is called");
    next();
}

// Using my middleware for all requests
app.use(customMiddleware)

const storePostMiddleware = require('./middleware/storePost')

// Using my middleware only for request to '/posts/store'
app.use('/posts/store', storePostMiddleware);


// ============================================ Setting views directory ============================================
app.set('views',`${__dirname}/views`)


// ============================================ Creating actions for requests ============================================
app.get('/', homePageController)

app.get('/posts/new', createPostController)

app.post('/posts/store', storePostController)

app.get('/post/:id', getPostController)

// ============================================ Running application at port 4000 ============================================
// http://localhost:4000/
app.listen(4000, () => {
    console.log('App listening on port 4000');
})
