using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class adminusermanagement : System.Web.UI.Page
    {

        string strcon = ConfigurationManager.ConnectionStrings["MyDBConnection"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            Gridview1.DataBind();
            
        }
        // GO buuton
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            updateMemberStatusByID("active");

        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            updateMemberStatusByID("pending");
        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            updateMemberStatusByID("deactive");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            deleteMemberByID();
        }

        // user defined method

        void getMemberById()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();

                }
                SqlCommand cmd = new SqlCommand("SELECT * from member_master_tbl where member_id= '" + TextBox1.Text.Trim() + "'", con);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        TextBox2.Text = dr.GetValue(0).ToString();
                        TextBox7.Text = dr.GetValue(10).ToString();
                        TextBox8.Text = dr.GetValue(1).ToString();
                        TextBox9.Text = dr.GetValue(2).ToString();
                        TextBox10.Text = dr.GetValue(3).ToString();
                        TextBox3.Text = dr.GetValue(4).ToString();
                        TextBox4.Text = dr.GetValue(5).ToString();
                        TextBox11.Text = dr.GetValue(6).ToString();
                        TextBox5.Text = dr.GetValue(7).ToString();


                    }
                    
                }
                else
                {
                    Response.Write("<script>alert('" + lblmsg.Text + "');</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }

        }
        void updateMemberStatusByID(string status)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();

                }
                SqlCommand cmd = new SqlCommand("UPDATE member_master_tbl SET account_status= '" + status + "' WHERE member_id='"+TextBox1.Text.Trim()+"'", con);
               cmd.ExecuteNonQuery();
                con.Close();
                Gridview1.DataBind();
                Response.Write("<script>alert('Memeber Status Updated')</script>");

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }

        }

       void deleteMemberByID()
        {
            if(TextBox1.Text.Trim().Equals(""))
            {
                Response.Write("<script>alert('Member ID cannot be blank');</script>");
            }
            else
            {
                try
                {
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {

                        con.Open();
                    }
                    SqlCommand cmd = new SqlCommand("DELETE from member_master_tbl  WHERE member_id='" + TextBox1.Text.Trim() + "'", con);

                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Write("<script>alert('Member deleted Successfully');</script>");
                    ClearForm();
                    Gridview1.DataBind();
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");


                }

            }

        }

        void ClearForm()
        {
            TextBox1.Text = "";
            TextBox2.Text = "";
            TextBox7.Text = "";
            TextBox8.Text = "";
            TextBox9.Text = "";
            TextBox10.Text = "";
            TextBox3.Text = "";
            TextBox4.Text = "";
            TextBox11.Text = "";
            TextBox5.Text = "";
        }

        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            getMemberById();
        }
    }
}