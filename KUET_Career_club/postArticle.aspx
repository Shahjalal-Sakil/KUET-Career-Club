<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="postArticle.aspx.cs" Inherits="KUET_Career_club.postArticle" ValidateRequest="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="FreeTextBox" Namespace="FreeTextBoxControls" TagPrefix="FTB" %>
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
			
			<div>
				<h2 class="abouth2">Post Article</h2>
               
                                           
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
                            <asp:TextBox ID="articleTitle" runat="server" CssClass="registerTextbox"></asp:TextBox>
						</td>
					</tr>

					<tr>
						<td>Details:</td>
						<td>
							
                            
                            <FTB:FreeTextBox ID="articleDetails" runat="server" Width="550px" Height="200px"> </FTB:FreeTextBox>

						</td>
					</tr>
					<tr>
						<td></td>
						<td>
                            <asp:Button ID="articlePostButton" runat="server" Text="Post" OnClick="articlePostButton_Click"   />
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


