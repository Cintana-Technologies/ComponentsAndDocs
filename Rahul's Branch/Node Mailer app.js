var nodemailer = require('nodemailer');

let transporter = nodemailer.createTransport({
    service:'gmail',
    secure: false,
    port: 25,
    auth:{
        user: 'cintanatechnology@gmail.com',
        pass: '7277593672'
    },
    tls:{
        rejectUnauthorized:false
    }
});

let HelperOptions = {
    from: "cintanatechnology@gmail.com",
    to:"rahulsaivishnu@gmail.com",
    subject: 'Testing mail',
    text : 'hi people of cintana you have successfully received the mail from cintana technology'
};

transporter.sendMail(HelperOptions, (error, info) =>{
    if(error){
        console.log("message is not sent");
          return console.log(error); 
      } 
    else{
        console.log('The message was sent');
    }
   // console.log(info);
}); 

/*const notifier = require('mail-notifier');
 console.log("before imap");
const imap = {
  user: "cintanatechnology@gmail.com",
  password: "7277593672",
  host: "imap.gmail.com",
  port: 993, // imap port
  tls: true,// use secure connection
  tlsOptions: { rejectUnauthorized: false }
};
console.log("After imap");
notifier(imap)
  .on('mail', mail => console.log(mail,"your mail has been sent Successfully"))
  .start();
*/


