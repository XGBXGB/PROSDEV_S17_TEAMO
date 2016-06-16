<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Post"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.io.*"%>
<%@page import="javax.servlet.annotation.MultipartConfig"%>
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
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>

<body>
	<%
		List<Post> posts = (List<Post>) session.getAttribute("Posts");
		Iterator<Post> iposts = posts.iterator();
	%>

	<section class="header">
		<section class="nav">
			<div class="navbar-fixed">
				<nav>
					<div class="nav-wrapper nav-container transparent grow">
						<a href="#" class="brand-logo pad-nav-top"> TEAMO</a> <a href="#"
							data-activates="mobile-demo" class="button-collapse"><i
							class="material-icons">menu</i></a>
						<ul id="nav-mobile" class="right hide-on-med-and-down pad-nav-top">
							<li><a class="waves-effect waves-light btn compose-btn"
								href="new_post.jsp"><i class="material-icons compose-icon"
									style="">mode_edit</i></a></li>
							<li class="active"><a href="view_posts.jsp">Home</a></li>
							<li><a href="about_us.jsp">About Us</a></li>
							<li><a href="index.jsp">Logout</a></li>
						</ul>
						<ul class="side-nav teal" id="mobile-demo">
							<li><a href="new_post.jsp" class="white-text"><i
									class="material-icons left">mode_edit</i>New Post</a></li>
							<li class="active"><a href="view_posts.jsp"
								class="white-text">Home</a></li>
							<li><a href="about_us.jsp" class="white-text">About Us</a></li>
							<li><a href="index.jsp" class="white-text">Logout</a></li>
						</ul>
					</div>
				</nav>
			</div>
		</section>
	</section>


	<div class="container center-aligned">
		<div class="row">
			<%
				while (iposts.hasNext()) {
					Post p = iposts.next();
					String b64 = "";
					if(p.getImage() != null) {
					ByteArrayOutputStream baos = new ByteArrayOutputStream();
					ImageIO.write(p.getImage(), "jpg", baos);
					baos.flush();
					byte[] imageInByteArray = baos.toByteArray();
					baos.close();
					b64 = javax.xml.bind.DatatypeConverter.printBase64Binary(imageInByteArray);
					}
			%>

			<div class="card blue-grey darken-1">
				<div class="card-content white-text">
					<%
					if(!b64.equals("")) {
					%>
					<img src="data:image/jpg;base64, <%=b64%>"
						style="max-height: 300px" /> <br />
					<%
					}
					%>
					<span class="card-title"><%=p.getTitle()%></span>
					<p class="truncate"><%=p.username()%></p>
					<p class="truncate"><%=p.date()%></p>
					<p class="truncate"><%=p.getContent()%></p>
				</div>
				<form>
					<div class="card-action">
						<input type="Submit"
							class=" modal-action modal-close waves-effect waves-green btn white-text"
							value="view comments">
					</div>
				</form>
			</div>

			<%
				}
			%>
		</div>
	</div>

	<div class="container center-align">
		<ul class="pagination">
			<%
				int currentPage = (Integer) session.getAttribute("currentPage");
				int noOfPages = (Integer) session.getAttribute("noOfPages");
				if (currentPage == 1) {
			%>
			<li class="disabled"><a href=""><i class="material-icons">chevron_left</i></a></li>
			<%
				} else {
			%>
			<li class="waves-effect"><a
				href="PostsServlet?method=doGet&currentPage=<%=currentPage - 1%>"><i
					class="material-icons">chevron_left</i></a></li>
			<%
				}
				int from = ((currentPage - 1) / 5) * 5 + 1;
				int to = ((currentPage - 1) / 5) * 5 + 5;
				if (to >= noOfPages) {
					to = noOfPages;
				}
				for (int i = from; i <= to; i++) {
					if (i == currentPage) {
			%>
			<li class="active"><a
				href="PostsServlet?method=doGet&currentPage=<%=i%>"><%=i%></a></li>
			<%
				} else {
			%>
			<li class="waves-effect"><a
				href="PostsServlet?method=doGet&currentPage=<%=i%>"><%=i%></a></li>
			<%
				}
				}
			%>
			<%
				if (currentPage == noOfPages) {
			%>
			<li class="disabled"><a href=""><i class="material-icons">chevron_right</i></a></li>
			<%
				} else {
			%>
			<li class="waves-effect"><a
				href="PostsServlet?method=doGet&currentPage=<%=currentPage + 1%>"><i
					class="material-icons">chevron_right</i></a></li>
			<%
				}
			%>
		</ul>
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