/* Project Name :AIM for Seva
Filename : notification_master.js 
Purpose / Functionality: Performing the CRUD operations for Data Management from server-side
Author : Mythreyi(id:T0002)
*/

var connection = require('./../../model/config');
var proUtil = require('./../../model/util');
const express = require('express');
const router = express.Router();

var nodemailer = require('nodemailer'); // Declaration of Nodemailer
//nconf is a combination of npm and configuration which helps to read json files from any location in your project.
const fs = require('fs');

//function to perform insert operation for Templates from server side 
router.post('/setDataToDB', function(req, res, err) {
    try {
        var flag = '1', template_id = '000';          
        var today = new Date();
        var notification_master = {
            "template_name": req.body.template_name,
            "email_sub": req.body.email_sub,
            "email_content": req.body.email_content,
            "sms_content": req.body.sms_content,
            "active": req.body.active,
            "created_by": req.body.roleName,
            "created_on": '2018-02-01',
            "status":"sent"
        }
        console.log(notification_master);
        proUtil.invokeNotificationMasterInsert(notification_master, template_id, flag, connection, function(err, data) {
            try {
                if (err) {
                    throw err;
                } else {
                    res.json({
                        success: true,
                        data: data,
                        message: 'Record inserted successfully'
                    })
                }
            } catch (e) {
                res.json(e);
            }
        });
    }catch (err) {
        res.json({
            'output': err
        });
    }
});

//function to perform select operation to list all the Templates
router.get('/getAllList', function(req, res) {
    try {
        var flag = 2;
        var template_id = req.params.template_id = '000';
        proUtil.invokeNotificationMaster(template_id, flag, connection, function(err, data) {
            if (err) {
                throw err;
            } else {
                res.send(data);
            }
        })
    } catch (err) {
        res.json({
            'output': err
        });
    }
});

//function to perform select by Id operation to select a template by Id from server side
router.get('/getListById/:id', function(req, res, err) {
    try {
    var flag = 3;
    var template_id = req.params.id;
    proUtil.invokeNotificationMaster(template_id, flag, connection, function(err, data) {
        if (err) {
            res.send(err);
        } else {
            res.send(data);
        }
    })
} catch (err) {
        res.json({
            'output': err
        });
    }
});

//function to perform update operation by selecting the Id
router.put('/updateById/:id', function(req, res, err) {
    try {
    var notification_master = {
        "template_name": req.body.template_name,
        "email_sub": req.body.email_sub,
        "email_content": req.body.email_content,
        "sms_content": req.body.sms_content,
        "updated_by": req.body.role1,
        "active": req.body.active
    }
    var flag = 4;
    var template_id = req.params.id;
    proUtil.invokeNotificationMasterInsert(notification_master, template_id, flag, connection, function(err, data) {
        if (err) {
            res.send(err);
        } else {
            res.send(data);
        }
    })
}catch (err) {
        res.json({
            'output': err
        });
    }
});

//function to perform delete operation from server side
router.delete('/deleteById/:id', function(req, res, err) {
    try {
    var flag = 5;
    var template_id = req.params.id;
    proUtil.invokeNotificationMaster(template_id, flag, connection, function(err, data) {
        if (err) {
            res.send(err);
        } else {
            res.send(data);
        }
    })
}catch (err) {
        res.json({
            'output': err
        });
    }
});

//function to perform select operation to list all the donor details
router.get('/getAllDonorList', function(req, res) {
    try {
        var flag = 1;
        var donor_id = req.params.donor_id = '000';
        proUtil.invokeDonorDetails(donor_id, flag, connection, function(err, data) {
            if (err) {
                throw err;
            } else {
                res.send(data);
            }
        })
    } catch (err) {
        res.json({
            'output': err
        });
    }
});

//function to perform select by Id operation to select a donor by Id from server side
router.get('/getDonorListById/:id', function(req, res, err) {
    try {
    var flag = 2;
    var donor_id = req.params.id;
    proUtil.invokeDonorDetails(donor_id, flag, connection, function(err, data) {
        if (err) {
            res.send(err);
        } else {
            res.send(data);
        }
    })
} catch (err) {
        res.json({
            'output': err
        });
    }
});

//function to perform insert operation to add the E-mail content
router.post('/sendmail/:email_id/:email_content/:sub', function(req, res) { // Webservice for sending mail
    var email = req.params.email_id;
    var content = req.params.email_content;
     var sub = req.params.sub;
    // var donor_id=req.params.donor_id;
    // var donor_type=req.params.donor_type;
    // console.log(donor_id);    
    // console.log(donor_type);
    // var notification_history={
    //     "donor_id":donor_id,
    //     "status": 'Sent',
    //     "type": donor_type
    // }
    // console.log('hist',notification_history);
    // proUtil.invokeNotificationHistoryInsert(notification_history,connection, function (err,data) {
    //     console.log("working in dashboard");
                
    //   if (err) {
    //       throw err;
    //   } else {
    //      res.json({
    //       success:true,
    //       data:data,
    //       message:'Record inserted successfully'
    //      })
    //   }
    // });
    // var general_donor_history={
    //     "donor_id":donor_id,
    //     "status": 'Sent',
    //     "type": donor_type
    // }
    // console.log('hist',general_donor_history);
    // proUtil.invokeGeneralDonorHistoryInsert(general_donor_history,connection, function (err,data) {
    //     console.log("working in dashboard");
                
    //   if (err) {
    //       throw err;
    //   } else {
    //      res.json({
    //       success:true,
    //       data:data,
    //       message:'Record inserted successfully'
    //      })
    //   }
    // });
    // var sponsorship_history={
    //     "donor_id":donor_id,
    //     "status": 'Sent',
    //     "type": donor_type
    // }
    // console.log('hist',sponsorship_history);
    // proUtil.invokeSponsorshipHistoryInsert(sponsorship_history,connection, function (err,data) {
    //     console.log("working in dashboard");
                
    //   if (err) {
    //       throw err;
    //   } else {
    //      res.json({
    //       success:true,
    //       data:data,
    //       message:'Record inserted successfully'
    //      })
    //   }
    // });
    mailDetails(email, content, sub); // function call with Exception Handling
    
});


function mailDetails(email, content, sub) // Function Definition
{
    var fs = require("fs");
    // Get content from file
    var contents = fs.readFileSync("./module/mailconfig.json");
    // Define to JSON type
    var jsonContent = JSON.parse(contents);                                                    
    // Logic For Sending Mail
    let transporter = nodemailer.createTransport({
        service: jsonContent.service,
        secure: jsonContent.secure,
        port: jsonContent.port,
        auth: {
            user: jsonContent.useremail,
            pass: jsonContent.password
        },
        tls: {
            rejectUnauthorized: false
        }
    });
    let HelperOptions = { // function for the details of User and Sender.;
        from: jsonContent.useremail,
        to: email,
        text: content,
        subject: sub

    };
    transporter.sendMail(HelperOptions, (error, info) => { //Report information whether mail has sent or not
        if (error) {
             res.send(err);
        }
        else{
            console.log('Email sent: ' + info.response);
            console.log("cintana");
            
        }
    
    });

}

//function to perform insert operation to add the SMS content
router.post('/sendsms/:mobile_no/:sms_content', function(req, res) { // Webservice for sending mail
    var mobile_no = req.params.mobile_no;
    var sms_content = req.params.sms_content;
    //  var donor_id=req.params.donor_id;
    // var donor_type=req.params.donor_type;
    // console.log(donor_id);
    // console.log(donor_type);
    // var notification_history={
    //     "donor_id":donor_id,
    //     "status": 'Sent',
    //     "type": donor_type
    // }
    // console.log('hist',notification_history);
    // proUtil.invokeNotificationHistoryInsert(notification_history,connection, function (err,data) {
    //     console.log("working in dashboard");
                
    //   if (err) {
    //       throw err;
    //   } else {
    //      res.json({
    //       success:true,
    //       data:data,
    //       message:'Record inserted successfully'
    //      })
    //   }
    // });
    // console.log('hist',general_donor_history);
    // proUtil.invokeGeneralDonorHistoryInsert(general_donor_history,connection, function (err,data) {
    //     console.log("working in dashboard");
                
    //   if (err) {
    //       throw err;
    //   } else {
    //      res.json({
    //       success:true,
    //       data:data,
    //       message:'Record inserted successfully'
    //      })
    //   }
    // });
    // var sponsorship_history={
    //     "donor_id":donor_id,
    //     "status": 'Sent',
    //     "type": donor_type
    // }
    // console.log('hist',sponsorship_history);
    // proUtil.invokeSponsorshipHistoryInsert(sponsorship_history,connection, function (err,data) {
    //     console.log("working in dashboard");
                
    //   if (err) {
    //       throw err;
    //   } else {
    //      res.json({
    //       success:true,
    //       data:data,
    //       message:'Record inserted successfully'
    //      })
    //   }
    // });
   
    
    smsDetails(mobile_no, sms_content); // function call with Exception Handling
});

function smsDetails(mobile_no, sms_content) {
    var accountSid = "ACe42eb87e4db5568d210d632e8d5ae29f";
    var authToken = "d64a993f290de096e82cd5d0e4ea0706";
    var from = "+12015003242";
    var client = require('twilio')(accountSid, authToken);

    //var recenumb=['+919952967615','+918639471140','+919698655055'];
    client.messages.create({
        to: "+91" + mobile_no,
        from: from,
        body: sms_content,
    }, function(err, message) {
        if (err) {
            console.log(err);
        } else {
            console.log(message.sid);
        }
    });
}

router.post('/setDonorDataToDB', function (req, res, err) {
    console.log('inside of set donor data');
    try{                                                        
    var flag='1';
    var notification_history =  {
     "donor_id":req.body.donor_id,
     "status": 'Sent',
     "type": req.body.type
    }
    console.log(notification_history);
    proUtil.invokeNotificationHistoryInsert(notification_history,connection, function (err,data) {
        console.log("working in dashboard");
        try{        
      if (err) {
          throw err;
      } else {
         res.json({
          success:true,
          data:data,
          message:'Record inserted successfully'
         })
      }
      }
      catch(e)
      {
        res.json(e);
      }  
    });
   }
   catch (err) {
          res.json({
              'output': err
          });
  }
  });

  router.post('/setGeneralDonorDataToDB', function (req, res, err) {
    console.log('inside of set General donor data');
    try{                                                        
    var flag='1';
    var general_donor_history =  {
     "donor_id":req.body.donor_id,
     "status": 'Sent',
     "type": req.body.type
    }
    console.log(general_donor_history);
    proUtil.invokeGeneralDonorHistoryInsert(general_donor_history,connection, function (err,data) {
        console.log("working in dashboard");
        try{        
      if (err) {
          throw err;
      } else {
         res.json({
          success:true,
          data:data,
          message:'Record inserted successfully'
         })
      }
      }
      catch(e)
      {
        res.json(e);
      }  
    });
   }
   catch (err) {
          res.json({
              'output': err
          });
  }
  });

  router.post('/setsponsorshipDataToDB', function (req, res, err) {
    console.log('inside of set General donor data');
    try{                                                        
    var flag='1';
    var sponsorship_history =  {
     "donor_id":req.body.donor_id,
     "status": 'Sent',
     "type": req.body.type
    }
    console.log(sponsorship_history);
    proUtil.invokeSponsorshipHistoryInsert(sponsorship_history,connection, function (err,data) {
        console.log("working in dashboard");
        try{        
      if (err) {
          throw err;
      } else {
         res.json({
          success:true,
          data:data,
          message:'Record inserted successfully'
         })
      }
      }
      catch(e)
      {
        res.json(e);
      }  
    });
   }
   catch (err) {
          res.json({
              'output': err
          });
  }
  });

module.exports = router;
