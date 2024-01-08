
const mongoose = require('mongoose');

async function connect(){
    try {
        await mongoose.connect('mongodb://127.0.0.1/UserAPI' ,{ 

            useNewUrlParser: true,
            useUnifiedTopology: true
        });
        console.log('succes$')
    } catch (error) {
        console.log('falis');
    }
}

module.exports = {connect}