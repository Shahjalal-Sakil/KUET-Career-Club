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
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userEmail"] == null)
            {
                if (!this.IsPostBack)
                {
                    this.BindListView();
                }
            }
            else
            {
                Response.Redirect("userDashboard.aspx");
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
            // Response.Cookies["articleId"].Value = id;
            //Response.Cookies["articleId"].Expires = DateTime.Now.AddDays(1);
            Response.Redirect("article.aspx?articleId=" + id);
        }
        protected void loginButton_Click(object sender, EventArgs e)
        {

            
            KCCWebService web = new KCCWebService();
            DataSet ds = web.loginUser(loginEmail.Text, loginPassword.Text);
            if (ds.Tables[0].Rows.Count > 0)
                {
                   Session["userEmail"] = loginEmail.Text;
                   Response.Redirect("userDashboard.aspx");
                }
            else
                loginLabel.Text = "Invalid email or password !!";
        }
    }
}