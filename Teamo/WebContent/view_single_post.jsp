<%@page import="controller.Controller"%>
<%@page import="model.Comment"%>
<%@page import="java.util.List"%>
<%@page import="model.Post"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>


<!DOCTYPE html>
<html>
<head>
<!--Import Google Icon Font-->
<link href="http://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<!--Import materialize.css-->
<link type="text/css" rel="stylesheet"
	href="materialize/css/materialize.css" media="screen,projection" />
<link type="text/css" rel="stylesheet" href="css/main.css" />

<!--Let browser know website is optimized for mobile-->
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
</head>

<body>
	<section class="header">
		<section class="nav">
			<div class="navbar-fixed">
				<nav>
					<div class="nav-wrapper nav-container transparent grow">
						<a href="#" class="brand-logo pad-nav-top"> TEAMO</a> <a href="#"
							data-activates="mobile-demo" class="button-collapse"><i
							class="material-icons">menu</i></a>
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

	<%
		Post post = (Post) session.getAttribute("Currentpost");
	%>
	<div class="container center-aligned">
		<div class="row">
			<div class="card blue-grey darken-1">
				<div class="card-content white-text">
					<h2><%=post.getTitle()%></h2>
					<h6>
						by
						<%=post.getUsername()%></h6>
						<p><%=post.getContent()%></p>
				</div>
				<div class="card-content white-text">
					<h5 class="white-text">
						COMMENTS
						</h5>

						<%
							List<Comment> comments = post.getComments();

							for (int x = 0; x < post.getComments().size(); x++) {
						%>
						<p>
							"<%=comments.get(x).getComment()%>" by
							<%=comments.get(x).getUsername()%>
							on
							<%=comments.get(x).getDate()%></p>
						<%
							}
						%>
						<!--p>person: comment 1</p>
                  <p>person: comment 2</p-->
				</div>
				<div class="card-action">
					<form action="AddCommentServlet" method="post">
						<input type="text" placeholder="place comment here"
							class="white-text" name="postcomment" id="postcomment"> <input
							type="hidden" value="<%=post.getPostId()%>" name="postid"
							id="postid"> <input type="Submit"
							class=" modal-action modal-close waves-effect waves-green btn white-text"
							id="addcmnt" name="addcmnt" value="add Comment">
					</form>
					<!--a href="#">This is a link</a-->
				</div>
			</div>

		</div>
	</div>
	</div>

	<!--Import jQuery before materialize.js-->
	<script type="text/javascript"
		src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
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