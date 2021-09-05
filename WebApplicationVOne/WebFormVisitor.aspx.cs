using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplicationVOne
{
    public partial class WebFormVisitor : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnFindApplication_Click(object sender, EventArgs e)
        {
            GridViewApplicantion.DataBind();
        }

        protected void GridViewSiteVisit_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {


        }



        protected void GridViewSiteVisit_RowEditing(object sender, GridViewEditEventArgs e)
        {


        }

        protected void calArrivalDT_SelectionChanged(object sender, EventArgs e)
        {
            /*
            Calendar calArrivalDT = (Calendar)sender;
            TextBox tbArrivalDT = (TextBox)((GridViewRow)((Calendar)(sender)).Parent.Parent).FindControl("tbArrivalDT");


            tbArrivalDT.Text = calArrivalDT.SelectedDate.ToString();
            */

            /*
            Calendar calArrivalDT = (Calendar)sender;
            TextBox tbArrivalDT = (TextBox)((GridViewRow)((Calendar)(sender)).Parent.Parent).FindControl("tbArrivalDT");


            DateTime dt = calArrivalDT.SelectedDate;
            tbArrivalDT.Text = dt.ToString("dd/MM/yyyy");
            calArrivalDT.Visible = false;
            */
        }
    }
}