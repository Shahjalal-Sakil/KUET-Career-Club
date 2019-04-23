using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KUET_Career_club
{
    public partial class seeNotice : System.Web.UI.Page
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
            noticeListView.DataSource = web.noticeShowDetails();
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
    }
}