<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
    <head>
      <!--Import Google Icon Font-->
      <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
      <!--Import materialize.css-->
      <link type="text/css" rel="stylesheet" href="materialize/css/materialize.css"  media="screen,projection"/>
        <link type="text/css" rel="stylesheet" href="css/main.css"/>

      <!--Let browser know website is optimized for mobile-->
      <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    </head>

    <body>
        <section class = "content front-fullbg" style = "margin:0;">
            <div class = "row front-title">
                T E A M O
            </div>
            <div class = "row front-desc">
                Blog - Discover - Learn
            </div>
            <div id = "signupbtn" class = "row front-btn bgcolor-teal txtcolor-white signup-modal-trigger waves-effect waves-light btn" href="#modal-signup">
                SIGN UP
            </div>
            <div id = "signinbtn" class = "row front-btn bgcolor-white txtcolor-teal signin-modal-trigger" href="#modal-signin">
                LOG IN
            </div>
        </section>
        
        
                
         <!-- Modal Trigger -->
  <!--a class="waves-effect waves-light btn modal-trigger" href="#modal1">Modal</a>

  <!-- Modal Structure -->
     <form action="SignupServlet" method="post"> 
  <div id="modal-signup" class="modal">
    <div class="modal-content">
        <h4>Sign up</h4>
        <input type="text" placeholder = "Email" name = "SUemail">
        <input type="text" placeholder = "Username" name = "SUusername"> 
        <input type="password" placeholder = "Password" name = "SUpassword">
        <input type="password" placeholder = "Re-enter Password" name = "SUpassword2">
    </div>
    <div class="modal-footer">
      <input type = "submit" class = "waves-effect waves-green btn teal-text" value = "Sign Up">
      <a class=" modal-action modal-close waves-effect waves-green btn-flat">Cancel</a>
    </div>
  </div>
  </form>
  
   <form action="LoginServlet" method="post">      
  <div id="modal-signin" class="modal">
    <div class="modal-content">
      <h4>Sign in</h4>
        <input type="text" placeholder = "Username" name = "username"> 
        <input type="password" placeholder = "Password" name = "password">
    </div>
    <div class="modal-footer">
      <input type = "submit" class = "waves-effect waves-green btn teal-text" value = "Log in">
      <!-- a href="#!" class=" modal-action modal-close waves-effect waves-green btn teal-text">Log in</a-->
	  <a class=" modal-action modal-close waves-effect waves-green btn-flat">Cancel</a>    </div>
  </div>
  </form>
        
      <!--Import jQuery before materialize.js-->
      <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
      <script type="text/javascript" src="materialize/js/materialize.js"></script>
        <script>
            
            $(document).ready(function() {
                $('select').material_select();
            });
            
            
        $('.datepicker').pickadate({
    selectMonths: true, // Creates a dropdown to control month
    selectYears: 15 // Creates a dropdown of 15 years to control year
  });
            $(".button-collapse").sideNav();
            
            //modal stuff
            $(document).ready(function(){
            // the "href" attribute of .modal-trigger must specify the modal ID that wants to be triggered
            $('.signup-modal-trigger').leanModal();
            $('.signin-modal-trigger').leanModal();
                
          });
        </script>
    </body>
</html>