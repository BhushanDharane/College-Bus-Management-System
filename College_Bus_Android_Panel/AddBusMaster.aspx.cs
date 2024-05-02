using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AddBusMaster : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        LblId.Visible = true;
        if (Session["id"] != null)
        {
            LblId.Text = Session["id"].ToString();

            if (LblId.Text != null)
            {
                Binddata(LblId.Text);
            }
            Session.RemoveAll();
        }
    }

    private void Binddata(string Id)
    {
        try
        {
            btnsubmit.Text = "Update";
            SqlCommand com;
            string str;

            con.Open();
            str = "select * from bus_master where id='" + LblId.Text.Trim() + "'";
            com = new SqlCommand(str, con);
            SqlDataReader rd = com.ExecuteReader();
            if (rd.Read())
            {
                txtbus_no.Text = rd["bus_no"].ToString();
                txtstop_name.Text = rd["stop_name"].ToString();
            }
        }
        catch (Exception e1)
        {
            //string message = e1.Message;
        }
        finally
        {
            con.Close();
        }
    }

    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        if (btnsubmit.Text == "Update")
        {
            Update_data();
        }
        else
        {
            Insert_data();
        }
    }

    object id;
    private void Insert_data()
    {
        try
        {
            con.Open();
            string query = String.Format("insert into bus_master (bus_no, stop_name) values (@bus_no, @stop_name)");
            SqlCommand cmd = new SqlCommand(query, con);

            cmd.Parameters.AddWithValue("@bus_no", txtbus_no.Text);
            cmd.Parameters.AddWithValue("@stop_name", txtstop_name.Text);

            cmd.ExecuteNonQuery();
        }
        catch (Exception e1)
        {
            string msg = e1.Message;
        }
        finally
        {
            con.Close();
            Response.Redirect("AddBusMaster.aspx");
        }
    }

    private void Update_data()
    {
        try
        {
            con.Open();
            string query = String.Format("update bus_master set bus_no=@bus_no, stop_name=@stop_name where id='{0}'", LblId.Text);
            SqlCommand cmd = new SqlCommand(query, con);

            cmd.Parameters.AddWithValue("@bus_no", txtbus_no.Text);
            cmd.Parameters.AddWithValue("@stop_name", txtstop_name.Text);
            cmd.Parameters.AddWithValue("@id", LblId.Text);

            cmd.ExecuteNonQuery();
        }
        catch (Exception e1)
        {
            string msg = e1.Message;
        }
        finally
        {
            con.Close();
            Response.Redirect("AddBusMaster.aspx");
        }
    }
}