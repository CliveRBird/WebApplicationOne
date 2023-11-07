using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Diagnostics;

namespace WebApplicationVOne
{
    public partial class WFGallery : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            string error_message = hiddenFieldProductID.Value + txtComment.Text;

            txtComment.Text = error_message;

            string message = "This is a test message.";
            using (EventLog eventLog = new EventLog("Application"))
            {
                eventLog.Source = "WebApplicationVOne";
                eventLog.WriteEntry(message, EventLogEntryType.Information);
            }
        }
    }
}