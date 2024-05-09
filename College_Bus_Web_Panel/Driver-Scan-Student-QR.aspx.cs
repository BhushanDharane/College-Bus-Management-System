using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Driver_Scan_Student_QR : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnscan_Click(object sender, EventArgs e)
    {
        Response.Redirect("Scanner.aspx");
    }
}