<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="home.aspx.cs" Inherits="KUET_Career_club.index" ValidateRequest="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">



<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>KUET Career Club</title>
    <link href="style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        function startTime() {
            var today = new Date();
            var h = today.getHours();
            var m = today.getMinutes();
            var s = today.getSeconds();
            m = checkTime(m);
            s = checkTime(s);
            document.getElementById('txt').innerHTML = h + ":" + m + ":" + s;
            var t = setTimeout(startTime, 500);
        }
        function checkTime(i) {
            if (i < 10) { i = "0" + i };
            return i;
        }
    </script>
</head>
<body onload="startTime()">
    <form id="home" runat="server">
    <div class="headersection templete clear">
		<div class="logo clear">
			<img src="Images/logo2.png" alt="Logo"/>
			<h2>KUET Career Club</h2>
			<p>The Place of Kuetians</p>
		</div>	
        
    </div>
    <div class="navsection templete clear">
		<ul>
			<li><a id="active" href="home.aspx">Home</a></li>
			<li><a href="about.aspx">About</a></li>
			<li><a href="register.aspx">Register</a></li>
		</ul>
	</div>
    <div class="contentsection templete clear">
		
		<div class="maincontent clear" style="min-height:500px">
			<div class="samepost clear">
            
					 <asp:ListView ID="latestPost" runat="server">
                    <ItemTemplate>
                        <h2><%# Eval("title") %></h2>
                        
				<a href="#"><img src="Images/kuet_career_club.png" alt="post image here"/></a>
			 
                   <p style="font-family:none"><%# Eval("details") %></p> 
                        </ItemTemplate>
                    </asp:ListView>
				
				<div class="readmore clear">
					<a href="#">Read More</a>
				</div>
				
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
				<li><a href="home.aspx">Home</a></li>
				<li><a href="about.aspx">About</a></li>
				<li><a href="register.aspx">Register</a></li>
				<li><a href="#">Privacy</a></li>
			</ul>
		</div>
		<p>&copy; Copyright Shahjalal Sakil</p>
	</div>
    </form>
</body>
</html>
