using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KUET_Career_club
{
    public partial class changePassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userEmail"] == null)
            {
                Response.Redirect("login.aspx");
            }
        }

        protected void userPasswordChange_Click(object sender, EventArgs e)
        {
            int n;
            KCCWebService web = new KCCWebService();
            n = web.userPasswordChange(userCurrentPassword.Text, userNewPassword.Text, Session["userEmail"].ToString());
            if (n != 0)
                labelSucceed.Text = "Successfully Updated !!";
            else
                LabelFailed.Text = "Failed !!!";
        }
        protected void userLogoutButton_Click(object sender, EventArgs e)
        {
            Session.Remove("userEmail");
            Response.Redirect("login.aspx");
        }
    }
}