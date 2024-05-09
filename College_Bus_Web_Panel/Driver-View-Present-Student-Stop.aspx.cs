using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Driver_View_Present_Student_Stop : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString);

    string connStr = ConfigurationManager.ConnectionStrings["connection"].ConnectionString;
    SqlCommand com;
    string str;
    SqlCommand com1;
    string str1;
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            lblmobile.Text = Session["mobile"].ToString();
            BindDriver_bus_no();
            //CountPresentStudent();
            BinDStopName();
            BindAbsentStud();
        }
        catch (Exception e1)
        {
            //string msg = e1.Message;
        }
    }

    private void BindAbsentStud()
    {
        try
        {
            con.Open();
            String SQL = "select count(id) as id, stop_name from present_absent where bus_no='" + lblbus_no.Text + "' and date='" + DateTime.Now.ToShortDateString() + "' and p_a='A' group by id, stop_name";
            SqlDataAdapter Adpt = new SqlDataAdapter(SQL, con);
            DataSet ds = new DataSet();
            Adpt.Fill(ds);

            foreach (DataRow dr in ds.Tables[0].Rows)
            {
                lblstop_name.Text = dr["stop_name"].ToString() + "&nbsp;" + ":";
                lblabsent_stud.Text = dr["id"].ToString() + "&nbsp;" + "&nbsp;" + "&nbsp;" + "&nbsp;" + "&nbsp;" + "&nbsp;" + "&nbsp;" + "&nbsp;" + "&nbsp;" + "&nbsp;" + "&nbsp;" + "&nbsp;" + "&nbsp;" + "&nbsp;" + "&nbsp;" + "&nbsp;" + "&nbsp;" + "&nbsp;" + "&nbsp;" + "&nbsp;" + "&nbsp;" + "&nbsp;" + "&nbsp;" + "&nbsp;" + "&nbsp;" + "&nbsp;" + "&nbsp;" + "&nbsp;"
                    + "&nbsp;"
                    + "&nbsp;"
                    + "&nbsp;"
                    + "&nbsp;"
                    + "&nbsp;"
                    + "&nbsp;"
                    + "&nbsp;"
                    + "&nbsp;"
                    + "&nbsp;"
                    + "&nbsp;"
                    + "&nbsp;"
                    + "&nbsp;"
                    + "&nbsp;"
                    + "&nbsp;"
                    + "&nbsp;"
                    + "&nbsp;"
                + "<br />";

                string SN = lblstop_name.Text;
                string PS = lblabsent_stud.Text;
                string final = "Absent Student" + '\n' + SN + PS;
                lblabsent_result.Text += final.ToString();
            }

            //string Query = String.Format("select stop_name from present_absent where bus_no='{0}' and date='{1}'", lblbus_no.Text, DateTime.Now.ToShortDateString());
            //SqlDataAdapter cmd = new SqlDataAdapter(Query, con);
            //DataSet ds = new Dataset();
            //while (dr.Read())
            //{
            //    lblstop_name.Text = dr["stop_name"].ToString();
            //}
            //dr.Close();
            //con.Close();
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

    private void BinDStopName()
    {
        try
        {
            con.Open();
            String SQL = "select count(id) as id, stop_name from present_absent where bus_no='"+ lblbus_no.Text + "' and date='" + DateTime.Now.ToShortDateString() + "' and p_a='P' group by id, stop_name";
            SqlDataAdapter Adpt = new SqlDataAdapter(SQL, con);
            DataSet ds = new DataSet();
            Adpt.Fill(ds);

            foreach (DataRow dr in ds.Tables[0].Rows)
            {
                lblstop_name.Text = dr["stop_name"].ToString() + "&nbsp;" + ":" ;
                lblpresent_stud.Text = dr["id"].ToString() + "&nbsp;" + "&nbsp;" + "&nbsp;" + "&nbsp;" + "&nbsp;" + "&nbsp;" + "&nbsp;" + "&nbsp;" + "&nbsp;" + "&nbsp;" + "&nbsp;" + "&nbsp;" + "&nbsp;" + "&nbsp;" + "&nbsp;" + "&nbsp;" + "&nbsp;" + "&nbsp;" + "&nbsp;" + "&nbsp;" + "&nbsp;" + "&nbsp;" + "&nbsp;" + "&nbsp;" + "&nbsp;" + "&nbsp;" + "&nbsp;" + "&nbsp;"
                    + "&nbsp;"
                    + "&nbsp;"
                    + "&nbsp;"
                    + "&nbsp;"
                    + "&nbsp;"
                    + "&nbsp;"
                    + "&nbsp;"
                    + "&nbsp;"
                    + "&nbsp;"
                    + "&nbsp;"
                    + "&nbsp;"
                    + "&nbsp;"
                    + "&nbsp;"
                    + "&nbsp;"
                    + "&nbsp;"
                    + "&nbsp;"
                +"<br />";

                string SN = lblstop_name.Text;
                string PS = lblpresent_stud.Text;
                string final = SN + PS;
                lblresult.Text += final.ToString();
            }

            //string Query = String.Format("select stop_name from present_absent where bus_no='{0}' and date='{1}'", lblbus_no.Text, DateTime.Now.ToShortDateString());
            //SqlDataAdapter cmd = new SqlDataAdapter(Query, con);
            //DataSet ds = new Dataset();
            //while (dr.Read())
            //{
            //    lblstop_name.Text = dr["stop_name"].ToString();
            //}
            //dr.Close();
            //con.Close();
        }
        catch (Exception ex)
        {
            //System.Windows.Forms.MessageBox.Show("errror" + ex);
        }
        finally
        {
            con.Close();
            //Response.Write("<script> alert('Amount Deposited Successfully'); </script>");
        }
    }

    private void CountPresentStudent()
    {
        string SelectQuery = String.Format("SELECT count([id]), stop_name FROM present_absent where bus_no='{0}' and date='{1}' group by id, stop_name", lblbus_no.Text, DateTime.Now.ToShortDateString());
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand(SelectQuery, con);
            SqlDataReader Result = cmd.ExecuteReader();
            while (Result.Read())
            {
                for (int i = 0; i < Result.FieldCount; i++)
                {
                    var value1 = Result.GetValue(0);
                    var value2 = Result.GetValue(1);

                    lblpresent_stud.Text = value1.ToString();
                    lblstop_name.Text = value2.ToString();
                }

                //var value1 = Result.GetValue(0);
                //var value2 = Result.GetValue(1);

                //lblpresent_stud.Text = value1.ToString();
                //lblstop_name.Text = value2.ToString();

                //lblpresent_stud.Text = Result[0].ToString();
                //lblstop_name.Text = Result["stop_name"].ToString();
            }
        }
        catch (Exception e1)
        {
            string message = e1.Message;
        }
        finally
        {
            con.Close();
        }
    }

    private void BindDriver_bus_no()
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
}