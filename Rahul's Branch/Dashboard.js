/* Project Name :AIM for Seva
Filename : Dashboard.js 
Purpose / Functionality: Display all the details based on the donor 
Author : Karthick, Ankit, Pavithra
*/


var connection = require('./../../model/config');
var utils = require('./../../model/util');
const express = require('express');
const router = express.Router();
var nodemailer = require('nodemailer'); // Declaration of Nodemailer
//nconf is a combination of npm and configuration which helps to read json files from any location in your project.
const fs = require('fs');
var smsAndEmailData=require('./../../module/emailAndSmsData');

// Notification Master Start

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

// Notification Master End

//function to perform select operation to list the donor details in dashboard
router.get('/getAllList', function(req, res) {
    try {
    var flag = 'select';
    var donor_id = '000';
    utils.invokeDashboardMaster(donor_id, flag, connection, function(err, data) {
        if (err) {
            res.json(err);
        } else {
            res.json(data);
        }
    })
} catch (err) {
        res.json({
            'output': err
        });
    }
});

//function to perform select operation to list the Maintenance Sub-type from projects
router.get('/getSubTypeAllList', function(req, res) {
    try {
    var flag = 'subType';
    var donor_id = '000';
    utils.invokeDashboardMaster(donor_id, flag, connection, function(err, data) {
        if (err) {
            res.json(err);
        } else {
            res.json(data);
        }
    })
} catch (err) {
        res.json({
            'output': err
        });
    }
});

//function to perform select operation to list all the Sponsers
router.get('/getAllSponsorshipremindersList', function(req, res) {
    try {
    var flag = 'annual';
    var donor_id = '000';
    utils.invokeDashboardMaster(donor_id, flag, connection, function(err, data) {
        if (err) {
            res.json(err);
        } else {
            res.json(data);
        }
    })
} catch (err) {
        res.json({
            'output': err
        });
    }
});

//function to perform select by Id operation to select a particular Sponser
router.get('/allSponsorshipremindersRecordbyid/:id', function(req, res) {
    try {
    var flag = 'annualbyid';
    var donor_id = req.params.id;
    utils.invokeDashboardMaster(donor_id, flag, connection, function(err, data) {
        if (err) {
            res.json(err);
        } else {
            res.json(data);
        }
    })
} catch (err) {
        res.json({
            'output': err
        });
    }
});

//funto perform select by Id operation to select a particular donor
router.get('/getListById/:id', function(req, res) {
    try {
    var flag = 2;
    var donor_id = req.params.id;
    utils.invokeDashboardMaster(donor_id, flag, connection, function(err, data) {
        if (err) {
            res.json(err);
        } else {
            res.json(data);
        }
    })

} catch (err) {
        res.json({
            'output': err
        });
    }
});

router.get('/getAllListproject', function (req, res) {
 
    var flag=1;
    var project_id=req.params.id='000';
   utils.invokeprojectdashboard(project_id,flag,connection, function (err,data) {
      if (err) {
         res.json(err);
      } else {
          res.json(data);
      }
    })
   
  });

//function to perform select by Id operation to select a particular Sub-type from the projects
router.get('/getsubtypeListById/:id', function(req, res) {
    try {
    var flag = 'subTypebyid';
    var receipt_no = req.params.id;
    utils.invokeDashboardMaster(receipt_no, flag, connection, function(err, data) {
        if (err) {
            res.json(err);
        } else {
            res.json(data);
        }
    })
} catch (err) {
        res.json({
            'output': err
        });
    }
});



//function to perform insert operation to add the E-mail content
router.post('/sendDashmail/:email_id/:donor_id/:donor_type', function(req, res) { // Webservice for sending mail
    console.log("dashboard sms");
    var email = req.params.email_id;
    // var content = req.params.email_content;
    //  var sub = req.params.sub;
    var donor_id=req.params.donor_id;
    var donor_type=req.params.donor_type;
    console.log(donor_id);    
    console.log(donor_type);
    var notification_history={
        "donor_id":donor_id,
        "status": 'Sent',
        "type": donor_type
    }
    console.log('hist',notification_history);
    utils.invokeNotificationHistoryInsert(notification_history,connection, function (err,data) {
        console.log("working in dashboard");
                
      if (err) {
          throw err;
      } else {
         res.json({
          success:true,
          data:data,
          message:'Record inserted successfully'
         })
      }
    });
    mailDetails(email); // function call with Exception Handling
    
});

function mailDetails(email) // Function Definition
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
        text: "This day is very special to you and we Specially wish you to have a great day",
        subject: "Best Wishes"
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
router.post('/sendDashsms/:mobile_no/:donor_id/:donor_type', function(req, res) { // Webservice for sending mail
    var mobile_no = req.params.mobile_no;
    //var sms_content = req.params.sms_content;
     var donor_id=req.params.donor_id;
    var donor_type=req.params.donor_type;
    console.log(donor_id);
    console.log(donor_type);
    var notification_history={
        "donor_id":donor_id,
        "status": 'Sent',
        "type": donor_type
    }
    console.log('hist',notification_history);
    utils.invokeNotificationHistoryInsert(notification_history,connection, function (err,data) {
        console.log("working in dashboard");
                
      if (err) {
          throw err;
      } else {
         res.json({
          success:true,
          data:data,
          message:'Record inserted successfully'
         })
      }
    });
    smsDetails(mobile_no); // function call with Exception Handling
});

function smsDetails(mobile_no) {
    var accountSid = "ACe42eb87e4db5568d210d632e8d5ae29f";
    var authToken = "d64a993f290de096e82cd5d0e4ea0706";
    var from = "+12015003242";
    var client = require('twilio')(accountSid, authToken);

    //var recenumb=['+919952967615','+918639471140','+919698655055'];
    client.messages.create({
        to: "+91" + mobile_no,
        from: from,
        body: "sms_content",
    }, function(err, message) {
        if (err) {
            console.log(err);
        } else {
            console.log(message.sid);
        }
    });
}

router.post('/sendGenDashmail/:email_id/:donor_id/:donor_type', function(req, res) { // Webservice for sending mail
    var email = req.params.email_id;
    var donor_id=req.params.donor_id;
    var donor_type=req.params.donor_type;
    // console.log(donor_id);    
    // console.log(donor_type);
    var general_donor_history={
        "donor_id":donor_id,
        "status": 'Sent',
        "type": donor_type
    }
    console.log('hist',general_donor_history);
    utils.invokeGeneralDonorHistoryInsert(general_donor_history,connection, function (err,data) {
        console.log("working in dashboard");
                
      if (err) {
          throw err;
      } else {
         res.json({
          success:true,
          data:data,
          message:'Record inserted successfully'
         })
      }
    });
    mailGenDetails(email); // function call with Exception Handling
    
});

function mailGenDetails(email) // Function Definition
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
        text: "This day is very special to you and we Specially wish you to have a great day",
        subject: "Best Wishes"
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
router.post('/sendGenDashsms/:mobile_no/:donor_id/:donor_type', function(req, res) { // Webservice for sending mail
    var mobile_no = req.params.mobile_no;
    //var sms_content = req.params.sms_content;
     var donor_id=req.params.donor_id;
    var donor_type=req.params.donor_type;
    console.log(donor_id);
    console.log(donor_type);
    var general_donor_history={
        "donor_id":donor_id,
        "status": 'Sent',
        "type": donor_type
    }
    console.log('hist',general_donor_history);
    utils.invokeNotificationHistoryInsert(general_donor_history,connection, function (err,data) {
        console.log("working in dashboard");
                
      if (err) {
          throw err;
      } else {
         res.json({
          success:true,
          data:data,
          message:'Record inserted successfully'
         })
      }
    });
    smsGenDetails(mobile_no); // function call with Exception Handling
});

function smsGenDetails(mobile_no) {
    var accountSid = "ACe42eb87e4db5568d210d632e8d5ae29f";
    var authToken = "d64a993f290de096e82cd5d0e4ea0706";
    var from = "+12015003242";
    var client = require('twilio')(accountSid, authToken);

    //var recenumb=['+919952967615','+918639471140','+919698655055'];
    client.messages.create({
        to: "+91" + mobile_no,
        from: from,
        body: "sms_content",
    }, function(err, message) {
        if (err) {
            console.log(err);
        } else {
            console.log(message.sid);
        }
    });
}

router.post('/sendSponsorDashmail/:email_id/:donor_id/:donor_type', function(req, res) { // Webservice for sending mail
    var email = req.params.email_id;
    var donor_id=req.params.donor_id;
    var donor_type=req.params.donor_type;
    // console.log(donor_id);    
    // console.log(donor_type);
    var sponsorship_history={
        "donor_id":donor_id,
        "status": 'Sent',
        "type": donor_type
    }
    console.log('hist',sponsorship_history);
    utils.invokeSponsorshipHistoryInsert(sponsorship_history,connection, function (err,data) {
        console.log("working in dashboard");
                
      if (err) {
          throw err;
      } else {
         res.json({
          success:true,
          data:data,
          message:'Record inserted successfully'
         })
      }
    });
    mailSponsorDetails(email); // function call with Exception Handling
    
});

function mailSponsorDetails(email) // Function Definition
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
        text: "This day is very special to you and we Specially wish you to have a great day",
        subject: "Best Wishes"
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
router.post('/sendSponsorDashsms/:mobile_no/:donor_id/:donor_type', function(req, res) { // Webservice for sending mail
    var mobile_no = req.params.mobile_no;
    //var sms_content = req.params.sms_content;
     var donor_id=req.params.donor_id;
    var donor_type=req.params.donor_type;
    console.log(donor_id);
    console.log(donor_type);
    var sponsorship_history={
        "donor_id":donor_id,
        "status": 'Sent',
        "type": donor_type
    }
    console.log('hist',sponsorship_history);
    utils.invokeSponsorshipHistoryInsert(sponsorship_history,connection, function (err,data) {
        console.log("working in dashboard");
                
      if (err) {
          throw err;
      } else {
         res.json({
          success:true,
          data:data,
          message:'Record inserted successfully'
         })
      }
    });
    smsSponsorDetails(mobile_no); // function call with Exception Handling
});

function smsSponsorDetails(mobile_no) {
    var accountSid = "ACe42eb87e4db5568d210d632e8d5ae29f";
    var authToken = "d64a993f290de096e82cd5d0e4ea0706";
    var from = "+12015003242";
    var client = require('twilio')(accountSid, authToken);

    //var recenumb=['+919952967615','+918639471140','+919698655055'];
    client.messages.create({
        to: "+91" + mobile_no,
        from: from,
        body: "sms_content",
    }, function(err, message) {
        if (err) {
            console.log(err);
        } else {
            console.log(message.sid);
        }
    });
}


module.exports = router;