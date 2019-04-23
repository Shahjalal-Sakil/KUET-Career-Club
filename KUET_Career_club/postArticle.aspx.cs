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
    public partial class postArticle : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userEmail"] == null)
            {
                Response.Redirect("login.aspx");
            }
        }
        public string getUserName()
        {
            KCCWebService web = new KCCWebService();
            DataTable dt = web.userShow(Session["userEmail"].ToString());
            string userName = dt.Rows[0][0].ToString() + " " + dt.Rows[0][1].ToString();
            return userName;
        }

        protected void userLogoutButton_Click(object sender, EventArgs e)
        {
            Session.Remove("userEmail");
            Response.Redirect("login.aspx");
        }

        protected void articlePostButton_Click(object sender, EventArgs e)
        {
            int n;
            string author = getUserName();
           string article = articleDetails.Text;
           // article = Server.HtmlEncode(article);
          //  article = article.Replace(" ", "&nbsp;");
           // article = article.Replace("\r\n", "<br/>");
            KCCWebService web = new KCCWebService();
            n = web.articlePost(articleTitle.Text, article, author, Session["userEmail"].ToString());
            if (n != 0)
                labelSucceed.Text = "Article Posted !!";
            else
                LabelFailed.Text = "Failed !!!";
        }
    }
}