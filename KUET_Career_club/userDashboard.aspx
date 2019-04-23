<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="userDashboard.aspx.cs" Inherits="KUET_Career_club.userDashboard" %>



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
			<li><a href="about.aspx">About</a></li>
			<li><a href="register.aspx">Register</a></li>
            <li>
                <asp:LinkButton ID="userLogoutButton" runat="server" OnClick="userLogoutButton_Click">Logout</asp:LinkButton>
            </li>
           
		</ul>
	</div>
    <div class="contentsection templete clear">
        <div class="sidebar clear" style="float:left">
			<div class="samesidebar clear">
                 <div class="card">
                    <img src="Images/img_avatar.png" alt="Avatar" style="width:100%" />
                    <div class="container">
                        <h4><b>John Doe</b></h4>
                        <p>Architect</p>
                    </div>
                </div>
                <asp:TreeView runat="server" ID="userTreeView">    
                 <Nodes>        
                    <asp:TreeNode Text="User" NavigateUrl="#" Target="_blank">    
                      <asp:TreeNode Text="Post Article" NavigateUrl="~/postArticle.aspx"  />    
                      <asp:TreeNode Text="Edit Profile" NavigateUrl="~/editProfile.aspx"  />    
                      <asp:TreeNode Text="Change Password" NavigateUrl="~/changePassword.aspx" />    
                   </asp:TreeNode>    
   
                 </Nodes>    
             </asp:TreeView> 
				
			</div>
			
				
		</div>
		
		<div class="maincontent clear" style="float:right;margin-right:0px;min-height:600px">
			
			<div class="about">
				<h2>Hi ,<asp:Label ID="userLabel" runat="server" Text=""></asp:Label></h2>
                <asp:Panel ID="Panel1" runat="server">
                    <fieldset style="border-radius:10px">
                        <legend>Profile</legend>
                        <asp:Panel ID="Panel2" runat="server" style="">
                            <asp:ListView ID="userinfo" runat="server">
                                <ItemTemplate>
                                    
                                    <table>
                                        <tr>
                                            <th>First Name:</th>
                                            <td><%# Eval("firstName") %></td>
                                        </tr>
                                        <tr>
                                            <th>Last Name:</th>
                                            <td><%# Eval("lastName") %></td>
                                        </tr>
                                        <tr>
                                            <th>Email:</th>
                                            <td><%# Eval("email") %></td>
                                        </tr>
                                        <tr>
                                            <th>Address:</th>
                                            <td><%# Eval("address") %></td>
                                        </tr>
                                    </table>
                                        
                                </ItemTemplate>
                            </asp:ListView>
                                  </asp:Panel>
                    </fieldset>
                </asp:Panel>
				
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

