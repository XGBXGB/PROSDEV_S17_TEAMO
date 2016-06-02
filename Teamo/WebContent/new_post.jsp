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
        <section class="header">
            <section class="nav">
                <div class="navbar-fixed">
                <nav>
                    <div class="nav-wrapper nav-container transparent grow">
                        <a href="#" class="brand-logo pad-nav-top"> TEAMO</a>
                        <a href="#" data-activates="mobile-demo" class="button-collapse"><i class="material-icons">menu</i></a>
                        <ul id="nav-mobile" class="right hide-on-med-and-down pad-nav-top">
                            <li><a class="waves-effect waves-light btn compose-btn" href="new_post.jsp"><i class="material-icons compose-icon" style="">mode_edit</i></a></li>
                            <li><a href="view_posts.jsp">Home</a></li>
                            <li><a href="about_us.jsp">About Us</a></li>
                            <li><a href="index.jsp">Logout</a></li>
                        </ul>
                        <ul class="side-nav teal" id="mobile-demo">
                            <li class="active"><a href="new_post.jsp" class="white-text"><i class="material-icons left">mode_edit</i>New Post</a></li>
                            <li><a href="view_posts.jsp" class="white-text">Home</a></li>
                            <li><a href="about_us.jsp" class="white-text">About Us</a></li>
                            <li><a href="index.jsp" class="white-text">Logout</a></li>
                        </ul>
                    </div>
                </nav>
                </div>
            </section>
            
            
            
        </section>
        
        <div class="container">
          <form action="NewPostServlet" method="post">      
	         <div class="input-field">
                    <input id="title" class="white-text" type="text" name = "title">
                    <label for="title">Title</label>
                </div>
                <div class="input-field">
                    <textarea id="content" class="materialize-textarea white-text" name = "content"></textarea>
                    <label for="content">Content</label>
                </div>
                <button type = "submit" class="waves-effect waves-light btn right"><i class="material-icons left">cloud</i>Submit</button>
            </form>
        </div>
        
        
      <!--Import jQuery before materialize.js-->
      <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
      <script type="text/javascript" src="materialize/js/materialize.js"></script>
        <script>
            
            $(document).ready(function() {
                $('select').material_select();
                
                $(window).scroll(function() {
                    var scroll = $(window).scrollTop();

                    if (scroll >= 100) {
                        $('.nav-wrapper').removeClass("grow");
                        $('.nav-wrapper').addClass("teal");
                        $('.nav-wrapper').addClass("accent-4");
                        $('#nav-mobile').removeClass("pad-nav-top");
                        $('.nav-wrapper').removeClass("transparent");
                        $('.brand-logo').removeClass("pad-nav-top");
                    } else {
                        $('.nav-wrapper').addClass("grow");
                        $('.nav-wrapper').removeClass("teal");
                        $('.nav-wrapper').removeClass("accent-4");
                        $('#nav-mobile').addClass("pad-nav-top");
                        $('.nav-wrapper').addClass("transparent");
                        $('.brand-logo').addClass("pad-nav-top");
                    }
                });
            });
            
            
        $('.datepicker').pickadate({
    selectMonths: true, // Creates a dropdown to control month
    selectYears: 15 // Creates a dropdown of 15 years to control year
  });
            $(".button-collapse").sideNav();
        </script>
    </body>
</html>