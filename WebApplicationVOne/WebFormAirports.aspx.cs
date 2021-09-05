using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplicationVOne
{
    public partial class WebFormAirports : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LinkButtonFooterInsert(object sender, EventArgs e)
        {
            SqlDataSourceContinent.InsertParameters["Name"].DefaultValue =
                ((TextBox)GridViewContinent.FooterRow.FindControl("TextBoxFooterContientName")).Text;

            //bool t = true;
            //SqlDataSourceContinent.InsertParameters["Active"].DefaultValue = t.ToString();
            //
            SqlDataSourceContinent.InsertParameters["Active"].DefaultValue =
                ((CheckBox)GridViewContinent.FooterRow.FindControl("CheckBoxFooterContientActive")).Checked.ToString();

            SqlDataSourceContinent.Insert();
        }

        protected void LinkButtonEmptyDataInsert(object sender, EventArgs e)
        {
            SqlDataSourceContinent.InsertParameters["Name"].DefaultValue =
                ((TextBox)GridViewContinent.Controls[0].Controls[0].FindControl("TextBoxEmptyDataContientName")).Text;

            //bool t = true;
            //SqlDataSourceContinent.InsertParameters["Active"].DefaultValue = t.ToString();
            //
            SqlDataSourceContinent.InsertParameters["Active"].DefaultValue =
                ((CheckBox)GridViewContinent.Controls[0].Controls[0].FindControl("CheckBoxEmptyDataContientActive")).Checked.ToString();

            SqlDataSourceContinent.Insert();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/index.html");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/WebFormDocEditor.aspx");

        }
    }
}