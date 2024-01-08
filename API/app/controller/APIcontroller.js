const user = require('../models/data')


class ApiControl{
    // GET
    getUser(req, res, next){
        user.find({})
            .then(
               users=> res.json(users)
            )
            .catch(next);
    }
    getUserID(req, res, next){
        const id = req.params.id
        user.findById(id) 
            .then(
                users => res.json(users)
            )
            .catch(next)
        // res.send(id);
    }
    getAll_ID(req, res,next){
        user.find({})
            .then(
                function (users){
                    const IDuser = users.map(value => value._id)
                    res.send(IDuser)
                }
            )
            .catch(next)
        
    }

    // POST
    addUser(req, res, next){
        const users = new user(req.body);
        user.create(users)
            .then(res.status(201).send('succesfull'))
            .catch(next)
    }
    // PUT
    updateUser(req, res, next){
        const id = req.params.id;
        user.findByIdAndUpdate(id, req.body)
            .then(
                res.status(201)
            )
            .catch(next)
        user.findById(id)
                .then(
                    users=>res.json(users)
                )
                .catch(next)
    }
    // DELETE
    deleteUser(req, res, next){
        const id = req.params.id;
        user.findByIdAndDelete(id)
            .then(res.status(202).send('delete Success ' + id))
            .catch(next);
    }
    // deleteAllUser(req, res, next){
    //     user 
        
            
    // }
}

module.exports = new ApiControl;