using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class dashboard : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            lblmobile.Text = Session["mobile"].ToString();
        }
        catch (Exception e1)
        {
            //string msg = e1.Message;
        }
    }

    protected void btnscan_Click(object sender, EventArgs e)
    {
        try
        {
            Response.Redirect("Scanner.aspx");
        }
        catch (Exception e1)
        {
            //string msg = e1.Message;
        }
    }
}