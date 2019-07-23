const path = require('path')
const express = require('express')
const expressEdge = require('express-edge')
const mongoose = require('mongoose')
const bodyParser = require('body-parser')
const app = new express()

const post = require('./database/models/post')
mongoose.connect('mongodb://localhost/node-js-blog')

const fileUpload = require('express-fileupload')

app.use(fileUpload())

app.use(express.static('public'))
//app.use(express.static(path.join(__dirname,'public')))

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
    const { image } = req.files

    image.mv(path.resolve(__dirname, 'public/posts', image.name), (error) => {
        post.create({
            ...req.body,
            image: `/posts/${image.name}`
        }, (error, post) => {
            res.redirect('/')
        })
    })

    // console.log(req.files)

    // console.log(req.body)

    //console.log(req.body)
    // prints post form data
})

app.get('/about', (req,res) => {
    //res.sendfile(path.resolve(__dirname,'public/about.html'))
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
    //res.sendfile(path.resolve(__dirname,'public/contact.html'))
    res.render('contact')
})


app.listen(4000, () => {
    console.log('App listening on port 4000');
})

