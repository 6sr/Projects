const path = require('path')
const express = require('express')
const expressEdge = require('express-edge')
const mongoose = require('mongoose')
const bodyParser = require('body-parser')
const app = new express()

const post = require('./database/models/post')
mongoose.connect('mongodb://localhost/node-js-blog')

app.use(express.static('pages'))
//app.use(express.static(path.join(__dirname,'pages')))

app.use(expressEdge)
app.set('views',`${__dirname}/views`)

// For post request - body-parser
app.use(bodyParser.json())
app.use(bodyParser.urlencoded({extended: true}))

app.get('/', async (req,res) => {
    const posts = await post.find({})

    console.log(posts)

    res.render('index', {
        posts
    })
})

app.get('/posts/new', (req,res) => {
    res.render('create')
})

app.post('/posts/store', (req,res) => {
    console.log(req.body)

    post.create(req.body, (error, post) => {
        res.redirect('/')
    })
    //console.log(req.body)
    // prints post form data
})

app.get('/about', (req,res) => {
    //res.sendfile(path.resolve(__dirname,'pages/about.html'))
    res.render('about')
})

app.get('/post/:id',async (req,res) => {
    const posts = await post.findById(req.params.id)

    console.log(req.params)

    res.render('post', {
        posts
    })
})

app.get('/contact', (req,res) => {
    //res.sendfile(path.resolve(__dirname,'pages/contact.html'))
    res.render('contact')
})


app.listen(4000, () => {
    console.log('App listening on port 4000');
})

