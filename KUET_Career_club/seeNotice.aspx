<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="seeNotice.aspx.cs" Inherits="KUET_Career_club.seeNotice" %>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>KUET Career Club</title>
    <link href="style.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="about" runat="server">
    <div class="headersection templete clear">
		<div class="logo clear">
			<img src="Images/logo2.png" alt="Logo"/>
			<h2>KUET Career Club</h2>
			<p>The Place of Kuetians</p>
		</div>	
    </div>
    <div class="navsection templete clear">
		<ul>
			<li><a href="home.aspx">Home</a></li>
			<li><a  href="about.aspx">About</a></li>
			<li><a href="register.aspx">Register</a></li>
		   
		</ul>
	</div>
    <div class="contentsection templete clear">
		
		<div class="maincontent clear">
			
			<div class="about">
				<h2>Notice</h2>
				<asp:ListView ID="noticeListView" runat="server">  
                     <ItemTemplate>  
                         <button class="acordion"><%#Eval("title") %></button>
                             
                             <div class="panel">
                             
                             <p> <%#Eval("details") %></p>
                             
                         </div>  
                     </ItemTemplate>  
                    
                </asp:ListView> 
			    
			</div>
			
		</div>
        <script type="text/javascript">
            var acc = document.getElementsByClassName("acordion");
            var i;
            for (i = 0; i < acc.length; i++) {
                acc[i].addEventListener("click", function () {
                    this.classList.toggle("noticeActive");
                    var panel = this.nextElementSibling;
                    if (panel.style.display === "block") {
                        panel.style.display = "none";
                    }
                    else {
                        panel.style.display = "block";
                    }

                });
            }
        </script>
		
		<div class="sidebar clear">
			<div class="samesidebar clear">
				<h2>Latest articles</h2>
                <asp:ListView ID="latestArticle" runat="server"  OnItemCommand="articleDetailsView">
                    <ItemTemplate>
				<ul>
					<li>
                    <asp:LinkButton ID="articleTitle" runat="server"  CommandArgument='<%# Eval("id") %>' ><%# Eval("title") %></asp:LinkButton>
                        </li>
				</ul>
                        </ItemTemplate>
                    </asp:ListView>
			</div>
			
		</div>
	</div>
	<div class="footersection templete clear">
		<div class="footermenu clear">
			<ul>
				<li><a href="#">Home</a></li>
				<li><a href="#">About</a></li>
				<li><a href="#">Contact</a></li>
				<li><a href="#">Privacy</a></li>
			</ul>
		</div>
		<p>&copy; Copyright Shahjalal Sakil</p>
	</div>
    </form>
</body>
</html>

