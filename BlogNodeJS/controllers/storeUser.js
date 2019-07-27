const user = require('../database/models/User')

module.exports = (req,res) => {
    user.create(req.body, (error, user) => {
        if(error) {
            // Error [ERR_HTTP_HEADERS_SENT]: Cannot set headers after they are sent to the client
            // Above error if this not returned
            return res.redirect('/auth/register')
        }
        res.redirect('/')
    })
};

