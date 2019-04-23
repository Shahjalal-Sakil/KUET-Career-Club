<%@ Page Language="C#" AutoEventWireup="true" CodeFile="about.aspx.cs" Inherits="KUET_Career_club.About" %>

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
			<li><a id="active" href="about.aspx">About</a></li>
			<li><a href="register.aspx">Register</a></li>
           
		</ul>
	</div>
    <div class="contentsection templete clear">
		
		<div class="maincontent clear">
			
			<div class="about">
				<h2>About Club</h2>
				<img src="Images/kuet_career_club.png" alt="Club image"/>
				
				<p>
                    <asp:ListView ID="clubAbout" runat="server">
                        <ItemTemplate>
                            <p><%# Eval("about") %> </p>

                        </ItemTemplate>
                    </asp:ListView>

				</p>
              
			</div>
			
		</div>
		
		<div class="sidebar clear">
			<div class="samesidebar clear">
				<h2>Latest articles</h2>
                <asp:ListView ID="latestArticle" runat="server"  OnItemCommand="articleDetailsView">
                    <ItemTemplate>
				<ul>
					<li>
                  <asp:LinkButton ID="articleTitle" runat="server"  CommandArgument='<%# Eval("id") %>' ><%# Eval("about") %></asp:LinkButton>
                        </li>
				</ul>
                        </ItemTemplate>
                    </asp:ListView>
			</div>
			<div class="samesidebar clear">
				<h2>Notice Board</h2>
				<asp:ListView ID="noticeListView" runat="server">  
    <ItemTemplate>  
        <div>  
           <li class="noticeShowTitle"><asp:Label runat="server" ID="noticeTitle" Text='<%#Eval("title") %>'></asp:Label>  </li>  
            <br />  
        </div>  
    </ItemTemplate>  
    <AlternatingItemTemplate>  
        <div>  
           <li class="noticeShowTitle"> <asp:Label runat="server" ID="noticeTitle" Text='<%#Eval("title") %>'></asp:Label> </li> 
            <br />  
        </div>  
    </AlternatingItemTemplate>  
</asp:ListView> 
                <div class="readmore clear">
					<a href="seeNotice.aspx">See More</a>
				</div>
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
