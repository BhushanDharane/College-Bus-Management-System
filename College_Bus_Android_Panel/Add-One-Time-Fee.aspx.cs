using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Add_One_Time_Fee : System.Web.UI.Page
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
            str = "select * from one_time_fee where id='" + LblId.Text.Trim() + "'";
            com = new SqlCommand(str, con);
            SqlDataReader rd = com.ExecuteReader();
            if (rd.Read())
            {
                txtstop_name.Text = rd["stop_name"].ToString();
                txtfee.Text = rd["fee"].ToString();
                txtstud_name.Text = rd["stud_name"].ToString();
                txtbus_no.Text = rd["bus_no"].ToString();
                txttime.Text = rd["bus_time"].ToString();
                txtdate.Text = rd["date"].ToString();
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

    private void Update_data()
    {
        try
        {
            con.Open();
            string query = String.Format("update one_time_fee set stop_name=@stop_name, fee=@fee, stud_name=@stud_name, bus_no=@bus_no, bus_time=@bus_time, date=@date where id='{0}'", LblId.Text);
            SqlCommand cmd = new SqlCommand(query, con);

            cmd.Parameters.AddWithValue("@stop_name", txtstop_name.Text);
            cmd.Parameters.AddWithValue("@fee", txtfee.Text);
            cmd.Parameters.AddWithValue("@stud_name", txtstud_name.Text);
            cmd.Parameters.AddWithValue("@bus_no", txtbus_no.Text);
            cmd.Parameters.AddWithValue("@bus_time", txttime.Text);
            cmd.Parameters.AddWithValue("@date", txtdate.Text);

            cmd.ExecuteNonQuery();
        }
        catch (Exception e1)
        {
            //string msg = e1.Message;
        }
        finally
        {
            con.Close();
            Response.Redirect("Add-One-Time-Fee.aspx");
        }
    }

    private void Insert_data()
    {
        try
        {
            con.Open();
            string query = String.Format("insert into one_time_fee (stop_name, fee, stud_name, bus_no, bus_time, date) values (@stop_name, @fee, @stud_name, @bus_no, @bus_time, @date)");
            SqlCommand cmd = new SqlCommand(query, con);

            cmd.Parameters.AddWithValue("@stop_name", txtstop_name.Text);
            cmd.Parameters.AddWithValue("@fee", txtfee.Text);
            cmd.Parameters.AddWithValue("@stud_name", txtstud_name.Text);
            cmd.Parameters.AddWithValue("@bus_no", txtbus_no.Text);
            cmd.Parameters.AddWithValue("@bus_time", txttime.Text);
            cmd.Parameters.AddWithValue("@date", txtdate.Text);

            cmd.ExecuteNonQuery();
        }
        catch (Exception e1)
        {
            //string msg = e1.Message;
        }
        finally
        {
            con.Close();
            Response.Redirect("Add-One-Time-Fee.aspx");
        }
    }
}