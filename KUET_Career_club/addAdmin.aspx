<%@ Page Language="C#" AutoEventWireup="true" CodeFile="addAdmin.aspx.cs" Inherits="KUET_Career_club.addAdmin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>KUET Career Club</title>
    <link href="styleAdmin.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
    

</head>
<body style="font-family:none;">
    <form id="about" runat="server">
    <div class="headersection templete clear">
		<div class="logo clear">
			<img src="Images/logo2.png" alt="Logo"/>
			<h2>KUET Career Club</h2>
			<p>The Place of Kuetians</p>
		</div>	
    </div>
        <div class="nav templete clear">
		<ul>
			<li><a href="#">Dashboard</a></li>
			<li><span>Admin Info</span>
				<ul>
				<li><a  href="#">Add Admin</a></li>
				<li><a  href="#">Change Password</a></li>
				</ul>
			</li>
            <li><span> User Post</span>
				<ul>
				<li><a  href="#">Pending</a></li>
				<li><a  href="#">Approved</a></li>
				</ul>
			</li>
			<li><a  href="home.aspx">Visit Website</a></li>
		</ul>
		</div>
    <div class="contentsection templete clear">
        <div class="sidebar clear" style="float:left">
			<div class="sameside clear">
                
             <ul>
				<li><a href="#">Post Notice</a></li>
				<li><span>Edit Page</span>
					<ul>
					<li><a  href="#">Edit Title</a></li>
					<li><a  href="#">Edit Slogan</a></li>
					</ul>
				</li>
                 <li><span>Club Info</span>
					<ul>
					<li><a  href="#">Edit About</a></li>
					<li><a  href="#">Edit Comittee</a></li>
					</ul>
				</li>
				<li><a  href="#">Add Photos</a></li>
		    </ul>
            

			</div>
               
				
			
			
				
		</div>		
		<div class="maincontent clear" style="float:right;margin-right:0px;min-height:600px">
			
			<div class="about">
				<h2>Add Admin</h2>
                
                    <table>
					<tr>
						<td>First Name:</td>
						<td>
                            <asp:TextBox ID="firstName" runat="server" CssClass="registerTextbox"></asp:TextBox>
						</td>
					</tr>
					<tr>
						<td>Last Name:</td>
						<td>
                            <asp:TextBox ID="lastName" runat="server" CssClass="registerTextbox"></asp:TextBox>
						</td>
					</tr>
					<tr>
                       
                            
						<td>Email:</td>
						<td>
                            
                            <asp:TextBox ID="email" runat="server" CssClass="registerTextbox" TextMode="Email"/>
                                
                            
                                
						</td>
					</tr>
                    <tr>
						<td>Password:</td>
						<td>
                            <asp:TextBox ID="password" runat="server" TextMode="Password" CssClass="registerTextbox"></asp:TextBox>
						</td>
                       
					</tr>

					<tr>
						<td>Photo:</td>
						<td>
                            <asp:FileUpload ID="adminPhoto" runat="server" />
						</td>
					</tr>
					<tr>
						<td></td>
						<td>
                            <asp:Button ID="registerAdmin" runat="server" Text="ADD" OnClick="registerAdmin_Click"/>
						</td>
					</tr>
                    <tr>
                        <asp:Label ID="labelSucceed" runat="server" Text="" ForeColor="Green"></asp:Label>
                        <asp:Label ID="LabelFailed" runat="server" Text="" ForeColor="Red"></asp:Label>
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


