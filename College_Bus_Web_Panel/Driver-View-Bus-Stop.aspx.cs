using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Driver_View_Bus_Stop : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            lblmobile.Text = Session["mobile"].ToString();
            GetBus_no();
            BindBusStop();
        }
        catch (Exception e1)
        {
            //string msg = e1.Message;
        }
    }

    private void GetBus_no()
    {
        try
        {
            con.Open();
            string Query = String.Format("select bus_no from add_bus where driver_contact='" + lblmobile.Text + "'");
            SqlCommand cmd = new SqlCommand(Query, con);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                lblbus_no.Text = dr["bus_no"].ToString();
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

    private void BindBusStop()
    {
        try
        {
            con.Open();
            string Query = String.Format("select stop_name from bus_master where bus_no='" + lblbus_no.Text + "'");
            SqlCommand cmd = new SqlCommand(Query, con);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                lblbus_stop.Text = dr["stop_name"].ToString();
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
}