// January 11, 2014
//-------------------------------------------------------------------------------------
// 	Authentication scenario architecture model, fast version
// 	from 
// 	Kristin Giammarco, Mikhail Auguston, Well, You didn’t Say not to! A Formal Systems
// 	 Engineering Approach to Teaching an Unruly Architecture Good Behavior,  
// 	 Complex Adaptive Systems Conference, November 13 - 15, 2013, Baltimore, MD  
// 	http://www.sciencedirect.com/science/article/pii/S1877050913010739
//---------------------------------------------------------------------------------------- 

ROOT 	User:  (* request_access 
                   (* <0-3> creds_invalid request_access  *)
                   (  ( creds_valid (run_services | abandon_access_request ) ) | 
                      ( creds_invalid ( attempt_exhausted | abandon_access_request ) ) ) 
                   end_User_session *); 

        request_access: provide_general_ID  provide_unique_ID;


ROOT 	System: (* request_unique_ID 
                    [ creds_invalid request_unique_ID
                        [ creds_invalid request_unique_ID
                            [ creds_invalid attempt_exhausted 
                              invalid_creds_notice cancel_access_request ] ] ]
                    [   (   ( creds_valid ( ( authorize_access run_services ) | 
                                          ( long_wait_for_User cancel_access_request ) ) ) |
                       ( creds_invalid long_wait_for_User cancel_access_request ) ) ]
                    end_System_session *);


//---------------------------------------------------------
User, System SHARE ALL creds_valid, creds_invalid, 
			attempt_exhausted, run_services;

//-----------------------------------------------------------------
// simulating COORDINATE with SHARE ALL
//-----------------------------------------------------------------
// 18	COORDINATE 	(* $x: provide_general_ID *) 	FROM User, 
// 19	    		(* $y: request_unique_ID *)  	FROM System 
// 20				ADD $x PRECEDES $y;
//------------------------------------------------------------------

ROOT 	UserSystem: (* <1-3> ( provide_general_ID   request_unique_ID ) *);

User,   UserSystem 	SHARE ALL 	provide_general_ID;
System, UserSystem 	SHARE ALL 	request_unique_ID;

//-----------------------------------------------------------------
// 21	COORDINATE 	(* $x: request_unique_ID *) 	FROM System, 
// 22	    		(* $y: provide_unique_ID *) 	FROM User
// 23				ADD $x PRECEDES $y;
//------------------------------------------------------------------
ROOT 	SystemUser: (* <1-3> ( request_unique_ID   provide_unique_ID ) *);

System, SystemUser 	SHARE ALL 	request_unique_ID;
User, 	SystemUser 	SHARE ALL 	provide_unique_ID;

