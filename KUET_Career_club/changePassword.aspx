<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="changePassword.aspx.cs" Inherits="KUET_Career_club.changePassword" %>


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
                <asp:TreeView runat="server" ID="userTreeView">    
                 <Nodes>        
                    <asp:TreeNode Text="User" NavigateUrl="#" Target="_blank">    
                      <asp:TreeNode Text="Post Article" NavigateUrl="#" Target="_blank" />    
                      <asp:TreeNode Text="Edit Profile" NavigateUrl="#" Target="_blank" />    
                      <asp:TreeNode Text="Change Password" NavigateUrl="#" Target="_blank" />    
                   </asp:TreeNode>    
   
                 </Nodes>    
             </asp:TreeView> 
				
			</div>
			
				
		</div>
		
		<div class="maincontent clear" style="float:right;margin-right:0px">
			
			<div class="about">
				<h2>Change Password</h2>
               
                                           
                <table>
                     <tr>
                         <td></td>
                         <td>
                        <asp:Label ID="labelSucceed" runat="server" ForeColor="Green" Font-Size="Large"></asp:Label>
                        <asp:Label ID="LabelFailed" runat="server" Text="" ForeColor="Red" Font-Size="Large"></asp:Label>
                            </td>
                    </tr>
                    <tr>
						<td>Current Password:</td>
						<td>
                            <asp:TextBox ID="userCurrentPassword" runat="server" TextMode="Password" CssClass="registerTextbox"></asp:TextBox>
						</td>
                       
					</tr>
					 <tr>
						<td>New Password:</td>
						<td>
                            <asp:TextBox ID="userNewPassword" runat="server" TextMode="Password" CssClass="registerTextbox"></asp:TextBox>
						</td>
                       
					</tr>
                    <tr>
						<td>Re-type New Password:</td>
						<td>
                            <asp:TextBox ID="confirmPassword" runat="server" TextMode="Password" CssClass="registerTextbox"></asp:TextBox>
                            <asp:CompareValidator ID="CompareValidatorPassword" runat="server"
                                       ErrorMessage ="Password not match !!"
                                       ControlToValidate="confirmPassword" ControlToCompare="userNewPassword"
                                       Type="String" Operator="Equal" ForeColor="Red">
                            </asp:CompareValidator>
						</td>
                    </tr>

                   
					
					<tr>
						<td></td>
						<td>
                            <asp:Button ID="userPasswordChange" runat="server" Text="Confirm" OnClick="userPasswordChange_Click"  />
						</td>
					</tr>
                   
				</table>
				
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




