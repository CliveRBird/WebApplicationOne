using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplicationVOne
{
    public partial class WFGallery : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            // Example of Cross Site Scripting to prove Code scanner is functioning
            string error_message = hiddenFieldProductID.Value + txtComment.Text;

            txtComment.Text = error_message;

        }
    }
}