using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace KUET_Career_club
{
    public partial class userDashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["userEmail"] == null)
            {
                Response.Redirect("login.aspx");
            }
            else
            {
                userLabel.Text = getUserName();
                getUserDetails();
            }
        }
        public string getUserName()
        {
            KCCWebService web = new KCCWebService();
            DataTable dt = web.userShow(Session["userEmail"].ToString());
            string userName = dt.Rows[0][0].ToString() +" "+ dt.Rows[0][1].ToString();
            return userName;
        }
        public void getUserDetails()
        {
            KCCWebService web = new KCCWebService();
            DataTable dt = web.userShow(Session["userEmail"].ToString());
            userinfo.DataSource = dt;
            userinfo.DataBind();
        }

        protected void userLogoutButton_Click(object sender, EventArgs e)
        {
            Session.Remove("userEmail");
            Response.Redirect("login.aspx");
        }
    }
}