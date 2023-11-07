using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplicationVOne
{
    public partial class WFWordDoc : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string htmlbody = "<html><body><div>Your name is: <b>" + Button1.Text + "</b></div>" +
                "</body></html>";

            string wordname = "MSworddoc.doc";
            Response.AppendHeader("Content-Type","application/msword");
            Response.AppendHeader("Content-disposition","attachment; filename=" + wordname);
            Response.Write(htmlbody);

        }
    }
}