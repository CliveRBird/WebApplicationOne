using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplicationVOne
{
    public partial class WFWordDoc2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            string htmlbody = "<html>Your name is: " + Button1.Text + "</html>'";

            string wordname = "MSworddoc.doc";
            Response.Clear();
            Response.ClearContent();
            Response.AppendHeader("Content-Type", "application/msword");
            Response.AppendHeader("Content-disposition", "attachment; filename=" + wordname);
            Response.Write(htmlbody);
            Response.Flush();
            Response.End();
        }
    }
}