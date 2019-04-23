using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KUET_Career_club
{
    public partial class postNotice : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void noticePostButton_Click(object sender, EventArgs e)
        {
            int n;
            KCCWebService web = new KCCWebService();
            n = web.noticePost(noticeTitle.Text,noticeDetails.Text);
            if (n != 0)
                labelSucceed.Text = "Notice Posted !!";
            else
                LabelFailed.Text = "Failed !!!";
        }
    }
}