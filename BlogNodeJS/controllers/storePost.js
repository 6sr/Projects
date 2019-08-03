const path = require('path')

const post = require('../database/models/Post')

module.exports = (req,res) => {
    const { image } = req.files

    image.mv(path.resolve(__dirname, '..', 'public/posts', image.name), (error) => {
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
};

