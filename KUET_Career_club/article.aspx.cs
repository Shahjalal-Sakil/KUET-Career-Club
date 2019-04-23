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
    public partial class article : System.Web.UI.Page
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
            // showPost.DataSource = web.showArticle(Session["articleId"].ToString());
            showPost.DataSource = web.showArticle(Request.QueryString["articleId"]);
            showPost.DataBind();
            // Session.Remove("articleId");
           // Response.Cookies["articleId"].Expires = DateTime.Now.AddDays(-1);
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
    }
}