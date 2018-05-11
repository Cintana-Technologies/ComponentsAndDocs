angular.module('commonServices', [])
    .factory('commonFactory', function($http) {

        MasterFactory = {};

        MasterFactory.create = function(regData, url) {

            return $http.post('/' + url + '/setDataToDB', regData);
        }
        MasterFactory.updateRecord = function(user, id, url) {
        
            return $http.put('/' + url + '/updateById' + '/' + id, user);
        }
        MasterFactory.removeRecord = function(url, id) {
            
            return $http.delete('/' + url + '/deleteById' + '/' + id);
        }
        MasterFactory.allRecord = function(url) {


            return $http.get('/' + url + '/getAllList');
        }
        MasterFactory.countryRecord = function(url) {


            return $http.get('/' + url + '/getCountryList');
        }
        MasterFactory.stateRecordById = function(url, id) {


            return $http.get('/' + url + '/getStateById' + '/' + id);
        }
        MasterFactory.searchRecordById = function(url, id) {


            return $http.get('/' + url + '/getListById' + '/' + id);
        }
        MasterFactory.forgotPass = function(email, url) {

            return $http.post('/' + url + '/changePassword', email);
        }
        MasterFactory.allProjectRecord = function(url) {


            return $http.get('/' + url + '/getProjectList');
        }
        MasterFactory.allMaintenanceRecord = function(url) {


            return $http.get('/' + url + '/getMaintenanceList');
        }
        MasterFactory.ProjectMaintenanceTypeRecord = function(url, id) {

            return $http.get('/' + url + '/getProjectMaintenanceTypeList' + '/' + id);
        }
        MasterFactory.ProjectMaintenanceSubTypeRecord = function(url, id) {


            return $http.get('/' + url + '/getProjectMaintenanceSubTypeList' + '/' + id);
        }
        MasterFactory.allprojectcategorynameRecord = function(url) {


            return $http.get('/' + url + '/getAllCategoryNameList');
        }

        MasterFactory.allCampaignRecord = function(url) {


            return $http.get('/' + url + '/getAllCampaignList');
        }

        MasterFactory.ProjectData = function(url) {


            return $http.get('/' + url + '/getAllProjectData');
        }
        MasterFactory.allPaymentRecord = function(url) {

            return $http.get('/' + url + '/getAllPaymentList');
        }
        MasterFactory.ProjectSubMaintenanceTypeRecord = function(url, id) {
         
            return $http.get('/' + url + '/getProjectSubMaintenanceTypeList' + '/' + id);
        }
        MasterFactory.allProjectData = function(url) {


            return $http.get('/' + url + '/getAllProjectData');
        }
        MasterFactory.searchRecordSubtypeById = function(url, id) {

            return $http.get('/' + url + '/getsubtypeListById' + '/' + id);
        }
        MasterFactory.allSubTypeRecord = function(url) {


            return $http.get('/' + url + '/getSubTypeAllList');
        }

        MasterFactory.allSponsorshipremindersRecord = function(url) {


            return $http.get('/' + url + '/getAllSponsorshipremindersList');
        }
        MasterFactory.allSponsorshipremindersRecordbyid = function(url, id) {
           
            return $http.get('/' + url + '/allSponsorshipremindersRecordbyid' + '/' + id);
        }
        MasterFactory.max = function(url) {


            return $http.get('/' + url + '/getMaxReceiptNo');
        }
        MasterFactory.allRecordproject = function(url) {


            return $http.get('/' + url + '/getAllListproject');
        }

        MasterFactory.searchRecordByIdproject = function(url, id) {


            return $http.get('/' + url + '/getListByIdproject' + '/' + id);
        }

        MasterFactory.sendsms=function(url,mobile_no,sms_content)
        {

        //console.log(mobile_no);
        return $http.post('/'+url+'/sendsms/'+mobile_no+"/"+sms_content);
        }

         MasterFactory.sendsmsGeneral=function(url,mobile_no,email,type)
        {

        //console.log(mobile_no);
        return $http.post('/'+url+'/sendsmsgeneral/'+mobile_no +"/"+email+"/"+type);
        }

        MasterFactory.sendmail = function(url,email_id, content, sub) {

            return $http.post('/' + url + '/sendmail/' + email_id + "/" + content + "/" + sub);
        }

        // Dashboard Mail
        MasterFactory.senddashmail = function(url,email_id,donor_id,donor_type) {

            return $http.post('/' + url + '/sendDashmail/' + email_id + "/"+ donor_id + "/"+ donor_type);
        }
        //End of dashboard Mail

        //send Dashboard SMS
        MasterFactory.sendDashsms=function(url,mobile_no,donor_id,donor_type)
        {

        //console.log(mobile_no);
        return $http.post('/'+url+'/sendDashsms/'+mobile_no+ "/"+ donor_id + "/"+ donor_type);
        }
        //End of send Dashboard SMS

          // Dashboard Mail
          MasterFactory.sendgendashmail = function(url,email_id,donor_id,donor_type) {

            return $http.post('/' + url + '/sendGenDashmail/' + email_id + "/"+ donor_id + "/"+ donor_type);
        }
        //End of dashboard Mail

        //send Dashboard SMS
        MasterFactory.sendGenDashsms=function(url,mobile_no,donor_id,donor_type)
        {

        //console.log(mobile_no);
        return $http.post('/'+url+'/sendGenDashsms/'+mobile_no+ "/"+ donor_id + "/"+ donor_type);
        }
        //End of send Dashboard SMS

          // Dashboard Mail
          MasterFactory.sendsponsordashmail = function(url,email_id,donor_id,donor_type) {

            return $http.post('/' + url + '/sendSponsorDashmail/' + email_id + "/"+ donor_id + "/"+ donor_type);
        }
        //End of dashboard Mail

        //send Dashboard SMS
        MasterFactory.sendsponsordashsms=function(url,mobile_no,donor_id,donor_type)
        {

        //console.log(mobile_no);
        return $http.post('/'+url+'/sendSponsorDashsms/'+mobile_no+ "/"+ donor_id + "/"+ donor_type);
        }
        //End of send Dashboard SMS

        // Added a new common service for role user & screen mapping start here
        MasterFactory.getAllUser = function(url) {

            return $http.get('/' + url + '/getAllUser');
        }
        MasterFactory.getAllScreen = function(url) {

            return $http.get('/' + url + '/getAllScreen');
        }
        MasterFactory.setDataToScreenmap = function(regData, role_id, url) {
            return $http.post('/' + url + '/setDataToScreenmap/' + role_id, regData);
        }
        MasterFactory.allpaymentRecord = function(url) {


            return $http.get('/' + url + '/getAllPaymentList');
        }
        MasterFactory.allprojectnameRecord = function(url) {


            return $http.get('/' + url + '/getAllProjectNameList');
        }
       
        // Added a new common service for role user & screen mapping end here
        MasterFactory.setDataToRolemap = function(x, x1, url) //added newly for role user bug insert
        {
            return $http.post('/' + url + '/setDataToRolemap/' + x + '/' + x1);
        }
        MasterFactory.landDonorById = function(url, donorid) {
            return $http.get('/' + url + '/landDonorList/' + donorid);
        }
        MasterFactory.generalDonorById = function(url, donorid) {
            return $http.get('/' + url + '/generalDonorList/' + donorid);
        }
        MasterFactory.annualDonorById = function(url, donorid) {
            return $http.get('/' + url + '/AnnualList/' + donorid);
        }
        MasterFactory.buildingDonorById = function(url, donorid) {
            return $http.get('/' + url + '/BuildingList/' + donorid);
        }
        MasterFactory.facilityDonorById = function(url, donorid) {
            return $http.get('/' + url + '/FacilityList/' + donorid);
        }
        MasterFactory.landDonorById = function(url, donorid) {
            return $http.get('/' + url + '/LandList/' + donorid);
        }
        MasterFactory.DonationList=function(url,donorid) {
        
            return $http.get('/'+url+'/getListByDonation/'+donorid);
        }
        MasterFactory.saveOfAnnual=function(regData,file,url) {
        console.log(regData,file);
            return $http.post('/'+url+'/setDataToDB/',regData,file);//{
                 /*transformRequest:angular.identity,
                    headers:{
                        'Content-Type':undefine
                    }
            });*/
        }
       MasterFactory.notificationList=function(url,donorid) {
        
            return $http.get('/'+url+'/notificationDonorList/'+donorid);
        }
         MasterFactory.facilityList=function(url,donorid) {
        
            return $http.get('/'+url+'/facilityDonorList/'+donorid);
        }
         MasterFactory.annualList=function(url,donorid) {
        
            return $http.get('/'+url+'/annualDonorList/'+donorid);
        }
         MasterFactory.buildingList=function(url,donorid) {
        
            return $http.get('/'+url+'/buildingDonorList/'+donorid);
        }
        
        return MasterFactory;
    });