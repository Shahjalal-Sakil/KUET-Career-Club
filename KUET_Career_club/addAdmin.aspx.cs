using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;
namespace KUET_Career_club
{
    public partial class addAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void registerAdmin_Click(object sender, EventArgs e)
        {
            int n;
            string fName = firstName.Text;
            string lName = lastName.Text;
            string eml = email.Text;
            string pwrd = password.Text;
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["KCCdbcon"].ConnectionString);
            string com = "Insert into [admin] values(@fname,@lname,@email,@password,@imgData)";
            SqlCommand cmd = new SqlCommand(com, con);
            cmd.CommandType = CommandType.Text;
            SqlParameter pfname = new SqlParameter()
            {
                ParameterName = "@fname",
                Value = fName

            };
            cmd.Parameters.Add(pfname);
            SqlParameter plname = new SqlParameter()
            {
                ParameterName = "@lname",
                Value = lName

            };
            cmd.Parameters.Add(plname);
            SqlParameter peml = new SqlParameter()
            {
                ParameterName = "@email",
                Value = eml

            };
            cmd.Parameters.Add(peml);
            SqlParameter ppwrd = new SqlParameter()
            {
                ParameterName = "@password",
                Value = pwrd

            };
            cmd.Parameters.Add(ppwrd);
            

            HttpPostedFile photoFile = adminPhoto.PostedFile;
            string fileName = Path.GetFileName(photoFile.FileName);
            string fileEx = Path.GetExtension(fileName);
            int fileSize = photoFile.ContentLength;
            if (fileEx.ToLower() == ".jpg" || fileEx.ToLower() == ".gif" || fileEx.ToLower() == ".png" || fileEx.ToLower() == ".bmp")
            {
                Stream stream = photoFile.InputStream;
                BinaryReader br = new BinaryReader(stream);
                Byte[] bytes = br.ReadBytes((int)stream.Length);
                SqlParameter pimgdata = new SqlParameter()
                {
                    ParameterName = "@imgData",
                    Value = bytes

                };
                cmd.Parameters.Add(pimgdata);
            }




            if (con.State != ConnectionState.Open)
                con.Open();
            n = cmd.ExecuteNonQuery();
            con.Close();
            if (n != 0)
                labelSucceed.Text = "Succesfully Added";
            else
                LabelFailed.Text = "Failed!!!";

        }
    }
}