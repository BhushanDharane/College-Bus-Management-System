using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Driver_Dashboard : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            //this.lblLatitude.Text = hfLat.Value;
            //this.lblLongitude.Text = hfLon.Value;
            lblmobile.Text = Session["mobile"].ToString();
            BindDriver_LatLong();
        }
        catch (Exception e1)
        {
            //string msg = e1.Message;
        }
    }

    private void BindDriver_LatLong()
    {
        try
        {
            con.Open();
            string Query = String.Format("select lat, long from add_bus where driver_contact='" + lblmobile.Text + "'");
            SqlCommand cmd = new SqlCommand(Query, con);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                lbllat.Text = dr["lat"].ToString();
                lbllong.Text = dr["long"].ToString();
            }
            dr.Close();
            con.Close();
        }
        catch (Exception ex)
        {
            //System.Windows.Forms.MessageBox.Show("errror" + ex);
        }
        finally
        {
            //Response.Write("<script> alert('Amount Deposited Successfully'); </script>");
        }
    }

    protected void btnview_location_Click(object sender, EventArgs e)
    {
        try
        {
            Response.Write("<script>window.open ('https://maps.google.com/?q=" + lbllat.Text + ',' + lbllong.Text + "');</script>");
        }
        catch (Exception e1)
        {
            //string msg = e1.Message;
        }
    }
}