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
    public partial class editProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userEmail"] == null)
            {
                Response.Redirect("login.aspx");
            }
            else
            {
                if(!IsPostBack)
                {
                    getUserDetails();
                }
                
            }
        }

        protected void userProfileUpdate_Click(object sender, EventArgs e)
        {
            int n;
            KCCWebService web = new KCCWebService();
            n = web.userProfileUpdate(userFirstName.Text, userLastName.Text, Session["userEmail"].ToString(), userAddress.Text);
            if (n != 0)
                labelSucceed.Text = "Successfully Updated !!";
            else
                LabelFailed.Text = "Failed !!!";
        }
        public void getUserDetails()
        {
            KCCWebService web = new KCCWebService();
            DataTable dt = web.userShow(Session["userEmail"].ToString());
            userFirstName.Text = dt.Rows[0]["firstName"].ToString();
            userLastName.Text = dt.Rows[0]["lastName"].ToString();
            userEmail.Text = dt.Rows[0]["email"].ToString();
            userAddress.Text = dt.Rows[0]["address"].ToString();
           
        }
        protected void userLogoutButton_Click(object sender, EventArgs e)
        {
            Session.Remove("userEmail");
            Response.Redirect("login.aspx");
        }
    }
}