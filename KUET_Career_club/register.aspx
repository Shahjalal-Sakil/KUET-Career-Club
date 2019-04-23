<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="KUET_Career_club.contact" %>

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
			<li><a id="active" href="register.aspx">Register</a></li>
		</ul>
	</div>
    <div class="contentsection templete clear">
		
		<div class="maincontent clear">
			
			<div class="about">
				<h2>Register</h2>
				
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
                            
                            <asp:TextBox ID="email" runat="server" CssClass="registerTextbox" TextMode="Email"   onchange="userEmailAvailability"/>
                                
                            
                                
						</td>
                        <td>
                            <asp:Label runat="server" ID="lblStatus"></asp:Label>
                        </td>
                               
					</tr>
                    <tr>
						<td>Password:</td>
						<td>
                            <asp:TextBox ID="password" runat="server" TextMode="Password" CssClass="registerTextbox"></asp:TextBox>
						</td>
                       
					</tr>
                    <tr>
						<td>Confirm Password:</td>
						<td>
                            <asp:TextBox ID="confirmPassword" runat="server" TextMode="Password" CssClass="registerTextbox"></asp:TextBox>
                            <asp:CompareValidator ID="CompareValidatorPassword" runat="server"
                                       ErrorMessage ="Password not match !!"
                                       ControlToValidate="confirmPassword" ControlToCompare="password"
                                       Type="String" Operator="Equal" ForeColor="Red">
                            </asp:CompareValidator>
						</td>
                    </tr>

					<tr>
						<td>Address:</td>
						<td>
							<asp:TextBox ID="address" runat="server" TextMode="MultiLine"></asp:TextBox>
						</td>
					</tr>
					<tr>
						<td></td>
						<td>
                            <asp:Button ID="register" runat="server" Text="Register" OnClick="register_Click" />
						</td>
					</tr>
                    <tr>
                        <asp:Label ID="labelSucceed" runat="server" Text="" ForeColor="Green"></asp:Label>
                        <asp:Label ID="LabelFailed" runat="server" Text="" ForeColor="Red"></asp:Label>
                    </tr>
                    <tr>
                        <td></td>
                        <td>Already have an account.So,<asp:HyperLink ID="hyperLinkLogin" runat="server" NavigateUrl="~/login.aspx">Login </asp:HyperLink> into your account..</td>
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
                    <asp:LinkButton ID="articleTitle" runat="server"  CommandArgument='<%# Eval("id") %>'><%# Eval("title") %></asp:LinkButton>
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
           <li class="noticeShowTitle"> <asp:Label runat="server" ID="noticeTitle" Text='<%#Eval("title") %>'></asp:Label> </li>  
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
    <script src="Scripts/jquery-1.7.1.min.js"></script>
    <script type="text/javascript">
        function userEmailAvailability() {
            $.ajax({
                type: "POST",
                url: "register.aspx/UserNameChecker",
                data: '{uEmail : "'+ $("#<%=email.ClientID%>")[0].value + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: OnSuccess,
                failure: function (response) {
                    alert(response);
                }
            });
        }

        function OnSuccess(response) {
            var msg = $("#<%=lblStatus.ClientID%>")[0];
            switch (response.d) {
                case "true":
                    msg.style.color = "red";
                    msg.innerHTML = "Email Already Exists";
                    break;
            }
        }
    </script>
</body>
</html>
