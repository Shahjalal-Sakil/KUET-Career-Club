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
    public partial class committee : System.Web.UI.Page
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
            noticeListView.DataSource = noticeShow();
            noticeListView.DataBind();
            latestArticle.DataSource = articleShow();
            latestArticle.DataBind();
            clubCommittee.DataSource = getInfo();
            clubCommittee.DataBind();
        }
        public void articleDetailsView(object sender, ListViewCommandEventArgs e)
        {
            string id = e.CommandArgument.ToString();
            // Session["articleId"] = id;
            // Response.Cookies["articleId"].Value = id;
            //Response.Cookies["articleId"].Expires = DateTime.Now.AddDays(1);
            Response.Redirect("article.aspx?articleId=" + id);
        }

        public DataTable getInfo()
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["KCCdbcon"].ConnectionString);
            DataTable dt = new DataTable();
            try
            {

                string cmd = "select title,slogan,about,committee from [clubInfo] where id=1";
                if (con.State != ConnectionState.Open)
                    con.Open();
                SqlCommand comnd = new SqlCommand(cmd, con);
                SqlDataAdapter sda = new SqlDataAdapter();

                sda.SelectCommand = comnd;
                sda.Fill(dt);



            }
            catch { }
            finally
            {
                con.Close();


            }
            return dt;

        }
        public DataTable articleShow()
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["KCCdbcon"].ConnectionString);
            DataTable dt = new DataTable();
            try
            {

                string cmd = "select top(4) * from [userArticle] order by id desc";
                if (con.State != ConnectionState.Open)
                    con.Open();
                SqlCommand comnd = new SqlCommand(cmd, con);
                SqlDataAdapter sda = new SqlDataAdapter();

                sda.SelectCommand = comnd;
                sda.Fill(dt);



            }
            catch { }
            finally
            {
                con.Close();


            }
            return dt;
        }
        public DataTable noticeShow()
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["KCCdbcon"].ConnectionString);
            DataTable dt = new DataTable();
            try
            {

                string cmd = "select top(3) title from [notice] order by time desc";
                if (con.State != ConnectionState.Open)
                    con.Open();
                SqlCommand comnd = new SqlCommand(cmd, con);
                SqlDataAdapter sda = new SqlDataAdapter();

                sda.SelectCommand = comnd;
                sda.Fill(dt);



            }
            catch { }
            finally
            {
                con.Close();


            }
            return dt;
        }



        /*  protected void userLogoutButton_Click(object sender, EventArgs e)
 {
     Session.Remove("userEmail");
     userLogoutButton.Visible = false;
     // Response.Redirect("login.aspx");
 }*/

    }
}