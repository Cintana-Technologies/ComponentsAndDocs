 var nodemailer = require('nodemailer');
 const notifier = require('mail-notifier');
 var multer = require('multer');
 var fs = require('fs');
 var contents = fs.readFileSync("./details.json");
 // Define to JSON type
 var jsonContent = JSON.parse(contents);   

 let transporter = nodemailer.createTransport({
     service: jsonContent.service,
     secure: false,
     port: jsonContent.portnumber,
     auth:{
         user: jsonContent.usermail,
         pass: jsonContent.userpass
     },
     tls:{
         rejectUnauthorized:false
     }
 });

 let HelperOptions = {
     from: jsonContent.sendermail,
     to:jsonContent.receivermail,
     subject: jsonContent.subject,
     text : jsonContent.text,
     // html: {
     //     path : 'mail.html'
     //   },
     html:jsonContent.html,
       attachments: [
         { //using a local file
           path: jsonContent.path
         }]
 };

 transporter.sendMail(HelperOptions, (error, info) =>{
     if(error){
         return setTimeout(error);  
         console.log("message is not sent");
         // return console.log(error); 
       } 
     else{
         console.log(info);
         console.log('Your message has been sent');
       //  Readmail(info);
        
     }
   
 }); 

 setTimeout(function () {
      transporter.sendMail(HelperOptions);
    //  console.log("your mail was resent after 5 sec") ;
    //  Readmail();
     }, 1000)
     
       notifier(HelperOptions)
        .on(jsonContent.receivermail, mail => console.log(mail))
        .start();
        console.log('your mail was Read by Receiver');

   





