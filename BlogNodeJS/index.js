const path = require('path')

const express = require('express')

const app = new express()

app.use(express.static('pages'))
//app.use(express.static(path.join(__dirname,'pages')))


app.get('/', (req,res) => {
    res.sendfile(path.resolve(__dirname,'pages/index.html'))
})

app.get('/about', (req,res) => {
    res.sendfile(path.resolve(__dirname,'pages/about.html'))
})

app.get('/post', (req,res) => {
    res.sendfile(path.resolve(__dirname,'pages/post.html'))
})

app.get('/contact', (req,res) => {
    res.sendfile(path.resolve(__dirname,'pages/contact.html'))
})


app.listen(4000, () => {
    console.log('App listening on port 4000');

})

