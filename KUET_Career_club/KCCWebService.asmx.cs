using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace KUET_Career_club
{
    /// <summary>
    /// Summary description for KCCWebService
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class KCCWebService : System.Web.Services.WebService
    {

        [WebMethod]
        public int userRegister(string fname, string lname, string email, string password, string address)
        {
            int n=0;
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["KCCdbcon"].ConnectionString);
            try
            {

                string cmd = "Insert into [userRegistration] values('" + fname + "','" + lname + "','" + email + "','" + password + "','" + address + "')";
                if (con.State != ConnectionState.Open)
                    con.Open();
                SqlCommand comnd = new SqlCommand(cmd, con);
                n = comnd.ExecuteNonQuery();


            }
            catch {  }
            finally
            {
                con.Close();
                
            }

            return n;

        }
        public DataSet loginUser(string loginEmail, string loginPassword)
        {
            DataSet ds = new DataSet();
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["KCCdbcon"].ConnectionString);
            if (con.State != ConnectionState.Open)
                con.Open();
            string comnd = "select * from [userRegistration] where email ='" + loginEmail + "' and password='" + loginPassword + "' ";
            SqlDataAdapter sda = new SqlDataAdapter(comnd,con);

            
            sda.Fill(ds);
           
            con.Close();
            return ds;

        }
        public int noticePost(string nTitle, string nDetails)
        {
            int n = 0;
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["KCCdbcon"].ConnectionString);
            try
            {

                string cmd = "Insert into [notice] values('" + nTitle + "','" + nDetails + "', GETDATE())";
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
        public DataTable noticeShowDetails()
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["KCCdbcon"].ConnectionString);
            DataTable dt = new DataTable();
            try
            {

                string cmd = "select title,details from [notice] order by time desc";
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
        public DataTable userShow(string userEmail)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["KCCdbcon"].ConnectionString);
            DataTable dt = new DataTable();
            try
            {

                string cmd = "select firstName,lastName,email,address from [userRegistration] where email='"+userEmail+"'";
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
        public int articlePost(string aTitle, string aDetails,string aAuthor,string uEmail)
        {
            int n = 0;
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["KCCdbcon"].ConnectionString);
            try
            {

                string cmd = "Insert into [userArticle](title,details,author,email,time) values('" + aTitle + "','" + aDetails + "','" + aAuthor + "','" + uEmail + "', GETDATE())";
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
        public DataTable articleShowDetails()
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["KCCdbcon"].ConnectionString);
            DataTable dt = new DataTable();
            try
            {

                string cmd = "select top(1) * from [userArticle] where status='approved' order by id desc ";
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
        public DataTable showArticle(string articleId)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["KCCdbcon"].ConnectionString);
            DataTable dt = new DataTable();
            try
            {

                string cmd = "select * from [userArticle] where id ='"+articleId+"'";
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
        public int userProfileUpdate(string fname , string lname , string userEmail ,string address)
        {
            int n = 0;
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["KCCdbcon"].ConnectionString);
            try
            {

                string cmd = "Update [userRegistration] set firstName ='"+fname+"',lastName='"+lname+"',address='"+address+"' where email='"+userEmail+"'";
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
        public int userPasswordChange(string currentPassword, string newPassword, string userEmail)
        {
            int n = 0;
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["KCCdbcon"].ConnectionString);
            try
            {

                string cmd = "Update [userRegistration] set password ='" + newPassword + "' where email='" + userEmail + "' and password='"+currentPassword+"'";
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
