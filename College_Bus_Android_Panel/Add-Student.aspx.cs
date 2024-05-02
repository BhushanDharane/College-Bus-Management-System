using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Add_Student : System.Web.UI.Page
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

        if (!this.IsPostBack)
        {
            string constr = ConfigurationManager.ConnectionStrings["connection"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT stop_name FROM bus_master"))
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Connection = con;
                    con.Open();
                    txtstop.DataSource = cmd.ExecuteReader();
                    txtstop.DataValueField = "stop_name";
                    txtstop.DataBind();
                    con.Close();
                }
            }
            txtstop.Items.Insert(0, new ListItem("--Select Stop Name--", "0"));
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
            str = "select * from student where id='" + LblId.Text.Trim() + "'";
            com = new SqlCommand(str, con);
            SqlDataReader rd = com.ExecuteReader();
            if (rd.Read())
            {
                //name, address, mobile, email, password, bus_no, stop, fees_paid, total_fees, pending_fees, college, year, dept
                txtstu_name.Text = rd["name"].ToString();
                txtaddress.Text = rd["address"].ToString();
                txtmobile.Text = rd["mobile"].ToString();
                txtemail.Text = rd["email"].ToString();
                txtpassword.Text = rd["password"].ToString();
                txtbus_no.Text = rd["bus_no"].ToString();
                txtstop.Text = rd["stop"].ToString();

                txtpaid_fees.Text = rd["fees_paid"].ToString();
                txttotal_fees.Text = rd["total_fees"].ToString();
                txtpending_fees.Text = rd["pending_fees"].ToString();
                txtcollge.Text = rd["college"].ToString();
                txtyear.Text = rd["year"].ToString();
                txtdept.Text = rd["dept"].ToString();
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
            cal_fees();
            Update_data();
        }
        else
        {
            cal_fees();
            Insert_data();
        }
    }

    private void Insert_data()
    {
        try
        {
            con.Open();

            string query = String.Format("insert into student (name, address, mobile, email, password, bus_no, stop, fees_paid, total_fees, pending_fees, college, year, dept, status) values (@name, @address, @mobile, @email, @password, @bus_no, @stop, @fees_paid, @total_fees, @pending_fees, @college, @year, @dept, @status)");
            SqlCommand cmd = new SqlCommand(query, con);

            cmd.Parameters.AddWithValue("@name", txtstu_name.Text);
            cmd.Parameters.AddWithValue("@address", txtaddress.Text);
            cmd.Parameters.AddWithValue("@mobile", txtmobile.Text);
            cmd.Parameters.AddWithValue("@email", txtemail.Text);
            cmd.Parameters.AddWithValue("@password", txtpassword.Text);
            cmd.Parameters.AddWithValue("@bus_no", txtbus_no.Text);
            cmd.Parameters.AddWithValue("@stop", txtstop.Text);

            cmd.Parameters.AddWithValue("@fees_paid", txtpaid_fees.Text);
            cmd.Parameters.AddWithValue("@total_fees", txttotal_fees.Text);
            cmd.Parameters.AddWithValue("@pending_fees", txtpending_fees.Text);
            cmd.Parameters.AddWithValue("@college", "SVIT");
            cmd.Parameters.AddWithValue("@year", txtyear.Text);
            cmd.Parameters.AddWithValue("@dept", txtdept.Text);
            cmd.Parameters.AddWithValue("@status", "0");

            cmd.ExecuteNonQuery();
        }
        catch (Exception e1)
        {
            string msg = e1.Message;
        }
        finally
        {
            con.Close();
            Response.Redirect("Add-Student.aspx");
        }
    }

    private void Update_data()
    {
        try
        {
            con.Open();

            string query = String.Format("update student set name=@name, address=@address, mobile=@mobile, email=@email, password=@password, bus_no=@bus_no, stop=@stop, fees_paid=@fees_paid, total_fees=@total_fees, pending_fees=@pending_fees, college=@college, year=@year, dept=@dept, status=@status where id = '{0}'", LblId.Text);
            SqlCommand cmd = new SqlCommand(query, con);

            cmd.Parameters.AddWithValue("@name", txtstu_name.Text);
            cmd.Parameters.AddWithValue("@address", txtaddress.Text);
            cmd.Parameters.AddWithValue("@mobile", txtmobile.Text);
            cmd.Parameters.AddWithValue("@email", txtemail.Text);
            cmd.Parameters.AddWithValue("@password", txtpassword.Text);
            cmd.Parameters.AddWithValue("@bus_no", txtbus_no.Text);
            cmd.Parameters.AddWithValue("@stop", txtstop.Text);

            cmd.Parameters.AddWithValue("@fees_paid", txtpaid_fees.Text);
            cmd.Parameters.AddWithValue("@total_fees", txttotal_fees.Text);
            cmd.Parameters.AddWithValue("@pending_fees", txtpending_fees.Text);
            cmd.Parameters.AddWithValue("@college", "SVIT");
            cmd.Parameters.AddWithValue("@year", txtyear.Text);
            cmd.Parameters.AddWithValue("@dept", txtdept.Text);
            cmd.Parameters.AddWithValue("@id", LblId.Text);
            cmd.Parameters.AddWithValue("@status", "0");

            cmd.ExecuteNonQuery();
        }
        catch (Exception e1)
        {
            string msg = e1.Message;
        }
        finally
        {
            con.Close();
            Response.Redirect("Add-Student.aspx");
        }
    }

    private void cal_fees()
    {
        try
        {
            float tf = 0, paid_fees = 0, pending = 0;
            tf = float.Parse(txttotal_fees.Text);
            paid_fees = float.Parse(txtpaid_fees.Text);

            pending = tf - paid_fees;
            txtpending_fees.Text = pending.ToString();
        }
        catch (Exception e1)
        {
            //string msg = e1.Message;
        }
    }

    protected void txtstop_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            SqlCommand com;
            string str;

            con.Open();
            str = "select bus_no from bus_master where stop_name='" + txtstop.Text.Trim() + "'";
            com = new SqlCommand(str, con);
            SqlDataReader rd = com.ExecuteReader();
            if (rd.Read())
            {
                txtbus_no.Text = rd["bus_no"].ToString();
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
}