<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="KUET_Career_club.login" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>KUET Career Club</title>
    <link href="style.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="contact" runat="server">
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
			<li><a href="about.aspx">About</a></li>
			<li><a href="register.aspx">Register</a></li>
		</ul>
	</div>
    <div class="contentsection templete clear">
		
		<div class="maincontent clear">
			
			<div class="about">
				<h2>Login :</h2>
				
				<table>
					
					<tr>
						<td>Email:</td>
						<td>
                            <asp:TextBox ID="loginEmail" runat="server" CssClass="registerTextbox" TextMode="Email"></asp:TextBox>
						</td>
					</tr>
                    <tr>
						<td>Password:</td>
						<td>
                            <asp:TextBox ID="loginPassword" runat="server" TextMode="Password" CssClass="registerTextbox"></asp:TextBox>
						</td>
                        </tr>
                       
					 <tr>
                        <td></td>
                        <td>
                            <asp:Label ID="loginLabel" runat="server" Text="" ForeColor="Red"></asp:Label>
                        </td>
                    </tr>

					<tr>
						<td></td>
						<td>
                            <asp:Button ID="loginButton" runat="server" Text="Login" OnClick="loginButton_Click" />
						</td>
					</tr>
                   

                    </table>
			</div>
			
		</div>
		
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

