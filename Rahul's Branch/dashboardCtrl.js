/* Project Name :AIM for Seva
Filename : countryMasterCtrl.js 
Purpose / Functionality: Performing the CRUD operations for Data Management from client-side
Author : Karthick, Ankit, Pavithra
*/

angular.module('dashboardCtrl', ['angularUtils.directives.dirPagination','commonServices'])
    .controller('dashCtrl', function($http, $state, $timeout, $scope,commonFactory) {

        var app = this;
        var url = 'dashboard';

            $scope.mailDetails = function($index){
                alert($index);
                

            }

        var refresh = function() {
            $scope.DOBRemider = []; //declare an empty array to store all the birthday and anniversary of the donors
            commonFactory.allRecord(url).then(function successCallback(response) {
                $scope.DOBRemider = response.data;
            });

        };
       
        refresh(); // calling function

        var refresh1 = function() {
            $scope.genralRemider = []; //declare an empty array to store all the Miantenance Sub-type of the donors
            commonFactory.allSubTypeRecord(url).then(function successCallback(response) {
                $scope.genralRemider = response.data;
            });
        };
        refresh1(); //calling function


        $scope.getGeneralDonorId = function(mobile_no,email,subtype) {
           console.log(mobile_no,email,subtype);
             commonFactory.sendsmsGeneral(mobile_no, email,subtype,url).then(function successCallback(response) {
                            //refresh();

                        });
        };


        var refresh2 = function() {
            $scope.Sponsorshipreminders = []; //declare an empty array to store all the Sponsership details
            commonFactory.allSponsorshipremindersRecord(url).then(function successCallback(response) {
                $scope.Sponsorshipreminders = response.data;
            });
        };
        refresh2();

        var select1 = function(donor_id) {
            $scope.project2 = []; //declare an empty array to search a project by Its Id
            commonFactory.allSponsorshipremindersRecordbyid(url, donor_id).then(function successCallback(response) {
                $scope.project2 = response.data;
            });
        }

        //function to search a record by its Id
        $scope.selectAllRecord = function(donor_id) {
            $scope.DOB = []; //declare an empty array
            commonFactory.searchRecordById(url, donor_id).then(function successCallback(response) {
                $scope.DOB = response.data;
            });
        }

         //function to search a record by its Id
        $scope.selectAllSubtypeRecord = function(donor_id) {;
            $scope.Subtype = [];
            commonFactory.searchRecordSubtypeById(url, donor_id).then(function successCallback(response) {
                $scope.Subtype = response.data;
            });

        }

        //function to search a record by its Id
        $scope.allSponsorshipremindersRecord = function(donor_id,mobile) {
            console.log('donor id of spo',donor_id,mobile);
            smsDetails(mobile,'hiiiiiii');
           /* $scope.Sponsorshipreminders = [];
            commonFactory.allSponsorshipremindersRecord(url, donor_id).then(function successCallback(response) {
                $scope.Sponsorshipreminders = response.data;
        select1(donor_id);
            });*/

        }



        // added by karthi for project table
        var refresh = function() {
            $scope.project = []; //declare an empty array
            commonFactory.allRecordproject(url).then(function successCallback(response) {
                $scope.project = response.data;
            });

            $scope.sort = function(keyname) {
                $scope.sortKey = keyname; //set the sortKey to the param passed
                $scope.reverse = !$scope.reverse; //if true make it false and vice versa
            }

        } 
   //     refresh(); //calling function

        var allTemp = function() {
            $scope.allTMaster = []; //declare an empty array to store all the Template names for sending notification
            MasterFactory.allRecord(url).then(function successCallback(response) {
                $scope.allTMaster = response.data;
            });
        };

        //function to display the Template Content
        $scope.getselectedval = function() {

            $scope.template_id = $scope.regData.template_id;
            $scope.email_sub = $scope.regData.email_sub;
            $scope.email_content = $scope.regData.email_content;
            $scope.sms_content = $scope.regData.sms_content;
            searchAllTempName($scope.template_id);
        }

        //function to search a template by its Id
        var searchAllTempName = function(template_id) {
            $scope.tname = [];
            commonFactory.searchRecordById(url, template_id).then(function successCallback(response) {
                $scope.tname = response.data;
            });
        }

        //function to display the donor details to send the notification
        var allDonor = function() {
            var url = 'donor';
            $scope.allDMaster = []; //declare an empty array
            MasterFactory.allRecord(url).then(function successCallback(response) {
                $scope.allDMaster = response.data;
            });
        };
        $scope.getselectedval1 = function(data) {

            $scope.donor_id = $scope.regData.donor_id;
            $scope.first_name = $scope.regData.first_name;
            $scope.email_id = $scope.regData.email_id;
            $scope.last_name = $scope.regData.last_name;
            $scope.mobile_no = $scope.regData.mobile_no;


            searchAllDonorName($scope.donor_id);
        }

        refresh(); //calling function
        allTemp(); //calling function
        allDonor(); //calling function
 
        //function to select a project by its Id
        $scope.select = function(project_id) {
            $scope.project1 = []; //declare an empty array
            commonFactory.searchRecordByIdproject(url, project_id).then(function successCallback(response) {
                $scope.project1 = response.data;
            });
        }

        var setTemplate = function(regData) {
            //console.log('fdgdhd',regData);
                swal({ //pop-up a alert message for the confirmation 
                        title: "Are you sure you want to save ?",
                        icon: "success",
                        buttons: true,
                        dangerMode: true,
                    })
                    .then((willSave) => {
                        if (willSave) {
                            //rest api calling the webservices
                            commonFactory.create(regData, url).then(function(data) {
                                console.log(data);
                                if (data.data.success) {
                                    $timeout(function() {
                                        $state.go('home.Dashboard');
                                    }, 2000)
                                    swal("Your record has been saved!", {
                                        icon: "success",
                                    });
                                    refresh();
                                } else {
                                    swal("check the data!", {
                                        icon: "warning",
                                    });
                                }
                            });
                        } else {
                            swal({
                                title: "Not save!",
                                text: "You clicked the button!",
                                icon: "warning",
                                button: "ok!",
                            });
                        }
                    });
            }

              //function to send E-mail to the particular donor 
        $scope.send = function(regData) {
            console.log('mailcall',regData);
         //   setTemplate(regData);
            swal({
                    title: "Are you sure?",
                    text: "Once you send its sent",
                    icon: "warning",
                    buttons: true,
                    dangerMode: true,
                })
                .then((willSend) => {
                    if (willSend) {
                    	//rest api calling the webservices
                        commonFactory.senddashmail(url,regData.email_id,regData.donor_id,regData.donor_type).then(function successCallback(response) {
                            refresh();
                        });
                      // $scope.mailDetails();
                        swal("Poof! Your mail has been sent!", {
                            icon: "success",
                        });
                    } else {
                        swal("Aborted...!");
                    }
                });
        }

        //function to send SMS to the particular donor
        $scope.sendsms = function(regData) {
            console.log('smscall',regData);
            setTemplate(regData);
            swal({
                    title: "Are you sure?",
                    text: "Once you send its sent",
                    icon: "warning",
                    buttons: true,
                    dangerMode: true,
                })
                .then((willSend) => {
                    if (willSend) {
                    	//rest api calling the webservices
                        commonFactory.sendDashsms(url,regData.mobile_no,regData.donor_id,regData.donor_type).then(function successCallback(response) {
                            refresh();
                        }); 
                        //$scope.smsDetails()
                        swal("Poof! Your sms has been sent!", {
                            icon: "success",
                        });
                    } else {
                        swal("Aborted...!");
                    }

                });

        }

                      //function to send E-mail to the particular donor 
                      $scope.generalsend = function(regData) {
                        console.log('mailcall',regData);
                     //   setTemplate(regData);
                        swal({
                                title: "Are you sure?",
                                text: "Once you send its sent",
                                icon: "warning",
                                buttons: true,
                                dangerMode: true,
                            })
                            .then((willSend) => {
                                if (willSend) {
                                    //rest api calling the webservices
                                    commonFactory.sendgendashmail(url,regData.email_id,regData.donor_id,regData.donor_type).then(function successCallback(response) {
                                        refresh();
                                    });
                                  // $scope.mailDetails();
                                    swal("Poof! Your mail has been sent!", {
                                        icon: "success",
                                    });
                                } else {
                                    swal("Aborted...!");
                                }
                            });
                    }
            
                    //function to send SMS to the particular donor
                    $scope.sendgeneralsms = function(regData) {
                        console.log('smscall',regData);
                        setTemplate(regData);
                        swal({
                                title: "Are you sure?",
                                text: "Once you send its sent",
                                icon: "warning",
                                buttons: true,
                                dangerMode: true,
                            })
                            .then((willSend) => {
                                if (willSend) {
                                    //rest api calling the webservices
                                    commonFactory.sendGenDashsms(url,regData.mobile_no,regData.donor_id,regData.donor_type).then(function successCallback(response) {
                                        refresh();
                                    }); 
                                    //$scope.smsDetails()
                                    swal("Poof! Your sms has been sent!", {
                                        icon: "success",
                                    });
                                } else {
                                    swal("Aborted...!");
                                }
            
                            });
            
                    }

                     //function to send E-mail to the particular donor 
                     $scope.sponsorsend = function(regData) {
                        console.log('mailcall',regData);
                     //   setTemplate(regData);
                        swal({
                                title: "Are you sure?",
                                text: "Once you send its sent",
                                icon: "warning",
                                buttons: true,
                                dangerMode: true,
                            })
                            .then((willSend) => {
                                if (willSend) {
                                    //rest api calling the webservices
                                    commonFactory.sendsponsordashmail(url,regData.email_id,regData.donor_id,regData.donor_type).then(function successCallback(response) {
                                        refresh();
                                    });
                                  // $scope.mailDetails();
                                    swal("Poof! Your mail has been sent!", {
                                        icon: "success",
                                    });
                                } else {
                                    swal("Aborted...!");
                                }
                            });
                    }
            
                    //function to send SMS to the particular donor
                    $scope.sendsponsorsms = function(regData) {
                        console.log('smscall',regData);
                        setTemplate(regData);
                        swal({
                                title: "Are you sure?",
                                text: "Once you send its sent",
                                icon: "warning",
                                buttons: true,
                                dangerMode: true,
                            })
                            .then((willSend) => {
                                if (willSend) {
                                    //rest api calling the webservices
                                    commonFactory.sendsponsordashsms(url,regData.mobile_no,regData.donor_id,regData.donor_type).then(function successCallback(response) {
                                        refresh();
                                    }); 
                                    //$scope.smsDetails()
                                    swal("Poof! Your sms has been sent!", {
                                        icon: "success",
                                    });
                                } else {
                                    swal("Aborted...!");
                                }
            
                            });
            
                    }
    
    });