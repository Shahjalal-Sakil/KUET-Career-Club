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
    public partial class editCommittee : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                getAbout();
            }
        }
        public void getAbout()
        {

            DataTable dt = getInfo();
            clubCommittee.Text = dt.Rows[0]["committee"].ToString();

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

        protected void updateCommitteeButton_Click(object sender, EventArgs e)
        {
            int n;

            n = clubCommitteetUpdate(clubCommittee.Text);
            if (n != 0)
                labelSucceed.Text = "Successfully Updated !!";
            else
                LabelFailed.Text = "Failed !!!";
        }
        public int clubCommitteetUpdate(string clubCommittee)
        {
            int n = 0;
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["KCCdbcon"].ConnectionString);
            try
            {
                
                string cmd = "Update [clubInfo] set committee ='" + clubCommittee + "' where id=1";
                if (con.State != ConnectionState.Open)
                    con.Open();
                SqlCommand comnd = new SqlCommand(cmd, con);
                n = comnd.ExecuteNonQuery();


            }
            catch { }
            finally
            {
                con.Close();

            }

            return n;
        }
    }
}