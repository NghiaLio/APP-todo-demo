const mongoose = require('mongoose');
const Schema = mongoose.Schema;


const User = new Schema({
    name:{type: String, require: true, minLength: 6},
    NumberPhone:{type: String, require: true ,minLength:10},
    Address: 
        {
            Address1: String,
            Address2:String,
            Address3:String, 
        },
        
    email:{type: String, require: true,},
    Country:{type: String, require: true,}
    
});


module.exports = mongoose.model("user_devs", User);
