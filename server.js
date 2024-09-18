const express = require('express'); 

const app = express(); 

app.get('/api/get',(req,res) =>{
    res.send({message : 'Nodejs Aws Deployment'});
})

app.listen(9000, (reg,res) => {
    console.log('server running on port 9000')
})
