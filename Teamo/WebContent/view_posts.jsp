<%@page import="model.Comment"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@page import="java.util.ArrayList"%>
<%@page import="model.Post"%>
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
        <%
        List<Post> searchedPosts =  (List<Post>)session.getAttribute("SearchPosts");
    	Iterator<Post> iposts;
    	if(searchedPosts!=null){
    		iposts = searchedPosts.iterator();
    		session.removeAttribute("SearchPosts");
    	}else{
			List<Post> posts = (List<Post>)session.getAttribute("Posts");
	    	iposts = posts.iterator();
    	}
        %>
    
      <section class="header">
        <section class="nav">
            <div class="navbar-fixed">
                <nav>
                    <div class="nav-wrapper nav-container transparent grow">
                        <a href="#" class="brand-logo pad-nav-top"> TEAMO</a>
                        <a href="#" data-activates="mobile-demo" class="button-collapse"><i class="material-icons">menu</i></a>
                        <ul id="nav-mobile" class="right hide-on-med-and-down pad-nav-top">
                        	<li>
                                <div class="search-bar" >
                                <form id="searchserv" action="SearchServlet" method="post">
                                    <div class="input-field search-field" style="height:40px">
                                      <input placeholder="Search Teamo" id="search" name="teamosearchbox" type="search" style="height:100% !important;margin:0;">
                                      <label for="search" style="height:100%;"><i class="material-icons" style="font-size:30px;height:100%;line-height:1.3">search</i></label>
                                    </div>
                                </form>
                                </div>
                            </li>
                            <li><a class="waves-effect waves-light btn compose-btn" href="new_post.jsp"><i class="material-icons compose-icon" style="">mode_edit</i></a></li>
                            <form action="HomeServlet" method = "post" style="display: inline;">
                            <li class="active"><a onClick="$(this).closest('form').submit();" >Home</a></li>
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
<form action="ViewSinglePostServlet" method="post">


      <div class="container center-aligned">
      	<div class="row">
      <%
	       while(iposts.hasNext())
	       {
	    	   Post p = iposts.next();
	    	   Iterator<Comment> comments = p.getComments().iterator();
       %>
	        
	        <div class="card blue-grey darken-1">
            	<div class="card-content white-text">
                	<a class="card-title post-title" onclick="pressed(this);$(this).closest('form').submit();" name = "<%=p.getPostId()%>" id = "<%=p.getPostId()%>" value = "<%=p.getPostId()%>"><span class="orange-text" ><%=p.getTitle() %></span></a>
              		<br>by <span class="author"><%=p.getUsername() %></span> 06/15/16
              		<p class="truncate"><%=p.getContent() %></p>
            	</div>
            	<ul class="collection">
            	<%
			       while(comments.hasNext())
			       {
			    	   Comment c = comments.next();
			    %>
                	<li class="collection-item">
	                    <span class="commenter"><%=c.getUsername() %> </span><span class="date"><%=c.getDate() %></span>
	                    <br>"<%=c.getComment() %>"
                	</li>
               	<% }
	            %>
            	</ul>
          	</div>
	        
        <%} %>
        <input type = "hidden" id = "vphidden" name = "vphidden" value = "1">
         </form>
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
    	  $(".search-field").keypress(function(event) {
    		    if (event.which == 13) {
    		        event.preventDefault();
    		        $("#searchserv").submit();
    		    }
    		});
    	  
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
      
      function pressed(element)
   	  {
   		var pressedBtn = element.id;
   		document.getElementById("vphidden").value = document.getElementById(pressedBtn).name;
      }
    </script>
  </body>
</html>

