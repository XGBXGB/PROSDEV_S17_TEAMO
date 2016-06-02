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
                            <li><a class="waves-effect waves-light btn compose-btn" href="new_post.html"><i class="material-icons compose-icon" style="">mode_edit</i></a></li>
                            <li class="active"><a href="view_posts.html">Home</a></li>
                            <li><a href="about_us.html">About Us</a></li>
                            <li><a href="index.html">Logout</a></li>
                        </ul>
                        <ul class="side-nav teal" id="mobile-demo">
                            <li><a href="new_post.html" class="white-text"><i class="material-icons left">mode_edit</i>New Post</a></li>
                            <li class="active"><a href="view_posts.html" class="white-text">Home</a></li>
                            <li><a href="about_us.html" class="white-text">About Us</a></li>
                            <li><a href="index.html" class="white-text">Logout</a></li>
                        </ul>
                    </div>
                </nav>
            </div>
            </section>
      </section>


      <div class="container center-aligned">
        <div class="row">
          <div class="card blue-grey darken-1">
            <div class="card-content white-text">
              <span class="card-title">Card Title</span>
              <p class="truncate">I am a very simple card. I am good at containing small bits of information. I asaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaasdfasdfasdfasdfasdfasdfasdfasdfasdfam convenient because I require little markup to use effectively.</p>
            </div>
            <div class="card-action">
              <a href="#">This is a link</a>
            </div>
          </div>

          <div class="card blue-grey darken-1">
            <div class="card-content white-text">
              <span class="card-title">Card Title</span>
              <p>I am a very simple card. I am good at containing small bits of information. I am convenient because I require little markup to use effectively.</p>
            </div>
            <div class="card-action">
              <a href="#">This is a link</a>
            </div>
          </div>

          <div class="card blue-grey darken-1">
            <div class="card-content white-text">
              <span class="card-title">Card Title</span>
              <p>I am a very simple card. I am good at containing small bits of information. I am convenient because I require little markup to use effectively.</p>
            </div>
            <div class="card-action">
              <a href="#">This is a link</a>
            </div>
          </div>

          <div class="card blue-grey darken-1">
            <div class="card-content white-text">
              <span class="card-title">Card Title</span>
              <p>I am a very simple card. I am good at containing small bits of information. I am convenient because I require little markup to use effectively.</p>
            </div>
            <div class="card-action">
              <a href="#">This is a link</a>
            </div>
          </div>

          <div class="card blue-grey darken-1">
            <div class="card-content white-text">
              <span class="card-title">Card Title</span>
              <p>I am a very simple card. I am good at containing small bits of information. I am convenient because I require little markup to use effectively.</p>
            </div>
            <div class="card-action">
              <a href="#">This is a link</a>
            </div>
          </div>
        </div>
      </div>

      <div class="container center-align">
        <ul class="pagination">
          <li class="disabled"><a href="#!"><i class="material-icons">chevron_left</i></a></li>
          <li class="active"><a href="#!">1</a></li>
          <li class="waves-effect"><a href="#!">2</a></li>
          <li class="waves-effect"><a href="#!">3</a></li>
          <li class="waves-effect"><a href="#!">4</a></li>
          <li class="waves-effect"><a href="#!">5</a></li>
          <li class="waves-effect"><a href="#!"><i class="material-icons">chevron_right</i></a></li>
        </ul>
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
      $(".button-collapse").sideNav();
    </script>
  </body>
</html>