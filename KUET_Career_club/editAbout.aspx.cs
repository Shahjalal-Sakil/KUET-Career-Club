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
    public partial class editAbout : System.Web.UI.Page
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
              clubAbout.Text = dt.Rows[0]["about"].ToString();

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



        protected void updateAboutButton_Click(object sender, EventArgs e)
        {
            int n;
           
            n = clubAboutUpdate(clubAbout.Text);
            if (n != 0)
                labelSucceed.Text = "Successfully Updated !!";
            else
                LabelFailed.Text = "Failed !!!";
        }
        public int clubAboutUpdate(string clubAbout)
        {
            int n = 0;
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["KCCdbcon"].ConnectionString);
            try
            {

                string cmd = "Update [clubInfo] set about ='" + clubAbout + "' where id=1";
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
