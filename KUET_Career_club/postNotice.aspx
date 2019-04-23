<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="postNotice.aspx.cs" Inherits="KUET_Career_club.postNotice" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>KUET Career Club</title>
    <link href="style.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="post_notice" runat="server">
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
				<h2>Post Notice :</h2>
				
				<table>
                     <tr>
                         <td></td>
                         <td>
                        <asp:Label ID="labelSucceed" runat="server" ForeColor="Green" Font-Size="Large"></asp:Label>
                        <asp:Label ID="LabelFailed" runat="server" Text="" ForeColor="Red" Font-Size="Large"></asp:Label>
                            </td>
                    </tr>
					<tr>
						<td>Title:</td>
						<td>
                            <asp:TextBox ID="noticeTitle" runat="server" CssClass="registerTextbox"></asp:TextBox>
						</td>
					</tr>

					<tr>
						<td>Details:</td>
						<td>
							<asp:TextBox ID="noticeDetails" runat="server" TextMode="MultiLine"></asp:TextBox>
						</td>
					</tr>
					<tr>
						<td></td>
						<td>
                            <asp:Button ID="noticePostButton" runat="server" Text="Post" OnClick="noticePostButton_Click"  />
						</td>
					</tr>
                   
				</table>
			</div>
			
		</div>
		
		<div class="sidebar clear">
			<div class="samesidebar clear">
				<h2>Latest articles</h2>
				<ul>
					<li><a href="#">Post title one</a></li>
					<li><a href="#">Post title two</a></li>
					<li><a href="#">Post title three</a></li>
					<li><a href="#">Post title four</a></li>
				</ul>
			</div>
			<div class="samesidebar clear">
				<h2>Sidebar one header</h2>
				<p>SideBar</p>
			</div>
			<div class="samesidebar clear">
				<h2>Sidebar one header</h2>
				<p>SideBar</p>
			</div>
			<div class="samesidebar clear">
				<h2>Sidebar one header</h2>
				<p>SideBar</p>
			</div>
			<div class="samesidebar clear">
				<h2>Sidebar one header</h2>
				<p>SideBar</p>
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

