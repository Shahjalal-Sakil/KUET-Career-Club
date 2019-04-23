using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Services;

namespace KUET_Career_club
{
    public partial class contact : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                this.BindListView();
            }

        }
        private void BindListView()
        {
            KCCWebService web = new KCCWebService();
            noticeListView.DataSource = web.noticeShow();
            noticeListView.DataBind();
            latestArticle.DataSource = web.articleShow();
            latestArticle.DataBind();
        }
        public void articleDetailsView(object sender, ListViewCommandEventArgs e)
        {
            string id = e.CommandArgument.ToString();
            // Session["articleId"] = id;
            //Response.Cookies["articleId"].Value = id;
            //Response.Cookies["articleId"].Expires = DateTime.Now.AddDays(1);
            Response.Redirect("article.aspx?articleId="+id);
        }

        protected void register_Click(object sender, EventArgs e)
        {
            int n;
            KCCWebService web = new KCCWebService();
            n = web.userRegister(firstName.Text, lastName.Text, email.Text, password.Text, address.Text);
            if (n != 0)
            {
                labelSucceed.Text = "Registration Completed !!";
                Response.Redirect("login.aspx");
            }
            else
                LabelFailed.Text = "Registration Failed";
        }
        [System.Web.Services.WebMethod]
        public static string UserNameChecker(string uEmail)
        {
            string retreval = "";
            KCCWebService web = new KCCWebService();
            DataTable dt = web.userShow(uEmail);
            if (dt.Rows.Count > 0)
            {
                retreval = "true";
            }
            else
                retreval = "false";
            return retreval;

        }
    }
}