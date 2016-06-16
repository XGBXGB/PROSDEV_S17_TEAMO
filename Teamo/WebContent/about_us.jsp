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
                            <form action="HomeServlet" method = "post" style="display: inline;">
                            <li class="active"><a onClick="$(this).closest('form').submit();">Home</a></li>
                            </form>
                            <li><a href="about_us.jsp">About Us</a></li>
                            <li><a href="index.jsp">Logout</a></li>
                        </ul>
                        <ul class="side-nav teal" id="mobile-demo">
                            <li><a href="new_post.jsp" class="white-text"><i class="material-icons left">mode_edit</i>New Post</a></li>
                           <form action="HomeServlet" method = "post" style="display: inline;">
							<li class="active"><a onClick="$(this).closest('form').submit();" class="white-text">Home</a></li>
							</form>
                            <li><a href="about_us.jsp" class="white-text">About Us</a></li>
                            <li><a href="index.jsp" class="white-text">Logout</a></li>
                        </ul>
                    </div>
                </nav>
            </div>
            </section>
      </section>
            
            <div class="about-us-main" style="margin:0;padding:0;">
                <div class="container">
                    <div class="row" style="margin-bottom:0;">
                        <div class="col s12 m12 l12">
                            <div class="what-is-teamo">
                                <span class="what-is">What is</span><span class="teamo-lbl">TEAMO</span><span class="question-mark">?</span>
                            </div>
                            <div class="about-teamo">
                                <span style="font-family:print clearly;font-size:1.5em;">Teamo</span> is a blogging site which can help you post and express your ideas and interests with ease. <br>It's simple. <br>It's beautiful. <br>It's free.  
                            </div>
                            <div class="divider"></div>
                        </div>
                        <div class="col s12 m12 l12">
                            <div class="what-is-teamo">
                                <span class="what-is">The Team-o</span>
                            </div>
                            <div class="team-desc">
                                <div class="container">
                                    <div class="row">
                                        <div class="col s12">
                                            <div class="col s2">
                                                <div class="member-img">
                                                    <img class="circle" src="images/piper.jpg"/>
                                                </div>
                                            </div>
                                            <div class="col s10">
                                                <div class="name-wrapper valign-wrapper">
                                                    <div class="member-name left-align">
                                                        Cheng, Jan Kristoffer
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col s12">
                                            <div class="col s10">
                                                <div class="name-wrapper valign-wrapper">
                                                    <div class="member-name right-align">
                                                        Cote, Christian Gabriel
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col s2">
                                                <div class="member-img">
                                                    <img class="circle" src="images/chris.jpg"/>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col s12">
                                            <div class="col s2">
                                                <div class="member-img">
                                                    <img class="circle" src="images/nona.jpg"/>
                                                </div>
                                            </div>
                                            <div class="col s10">
                                                <div class="name-wrapper valign-wrapper">
                                                    <div class="member-name left-align">
                                                        Erive, Winona Louise
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col s12">
                                            <div class="col s10">
                                                <div class="name-wrapper valign-wrapper">
                                                    <div class="member-name right-align">
                                                        Seo, Dong Seong
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col s2">
                                                <div class="member-img">
                                                    <img class="circle" src="images/jake.jpg"/>
                                                </div>
                                            </div>
                                        </div>
                                        
                                    </div>
                                </div>
                            </div>"
                        </div>
                    </div>
                </div>
            </div>
            <footer class="page-footer teal accent-4" style="margin-top:0;">
          <div class="footer-space">
            
          </div>
          <div class="footer-copyright">
            
          </div>
        </footer>
            
            
        </section>
        
        
        
        
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