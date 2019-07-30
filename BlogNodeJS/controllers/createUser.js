module.exports = (req,res) => {
    // console.log(req.session.registerationErrors)
    res.render('register', {
        errors: req.flash('registerationErrors')
    })
};
