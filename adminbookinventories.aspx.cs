using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class adminbookinventories : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["MyDBConnection"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            fillAuthorPublisherValues();
            GridView1.DataBind();

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (checkIfBookExists())
            {
                Response.Write("<script>alert('Book Already Exists, try some other Book ID');</script>");

            }
            else
            {
                addNewBook();
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {

        }

        protected void Button3_Click(object sender, EventArgs e)
        {

        }

        // user defined functions
        void fillAuthorPublisherValues()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();

                }
                SqlCommand cmd = new SqlCommand("SELECT author_name from author_master_tbl;", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                ddlAuthor.DataSource = dt;
                ddlAuthor.DataValueField = "author_name";
                ddlAuthor.DataBind();

                //publisher
                cmd = new SqlCommand("SELECT publisher_name from publisher_master_tbl;", con);
                da = new SqlDataAdapter(cmd);
                dt = new DataTable();
                da.Fill(dt);
                ddlPublisher.DataSource = dt;
                ddlPublisher.DataValueField = "publisher_name";
                ddlPublisher.DataBind();



            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
        }

        //user defined method
        bool checkIfBookExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd
                     = new SqlCommand("SELECT * from book_master_tbl where book_id= '" + TextBox1.Text.Trim() + "' OR book_name='" + TextBox2.Text.Trim() + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count >= 1)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                return false;
            }



        }

        void addNewBook()
        {
            try
            {
                string genres = "";
                foreach (int i in lstGenre.GetSelectedIndices())
                {
                    genres = genres + lstGenre.Items[i] + ",";
                }
                // genre = Adventure, Self Help,

                genres = genres.Remove(genres.Length - 1);

                string filepath = "~/book_inventory/userimg.png";
                string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
                FileUpload1.SaveAs(Server.MapPath("book_inventory/" + filename));
                filepath = "~/book_inventory/" + filename;


                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("INSERT INTO book_master_tbl (book_id,book_name,genre,author_name,publisher_name,publisher_date,language,edition,book_cost,no_of_pages,book_description,actual_stock,current_stock,book_img_link) " +
                    "values(@book_id,@book_name,@genre,@author_name,@publisher_name,@publisher_date,@language,@edition,@book_cost,@no_of_pages,@book_description,@actual_stock,@current_stock,@book_img_link)", con);

                cmd.Parameters.AddWithValue("@book_id", TextBox1.Text.Trim());
                cmd.Parameters.AddWithValue("@book_name", TextBox2.Text.Trim());
                cmd.Parameters.AddWithValue("@genre", genres);

                cmd.Parameters.AddWithValue("@author_name", ddlAuthor.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@publisher_name", ddlPublisher.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@publisher_date", TextBox4.Text.Trim());
                cmd.Parameters.AddWithValue("@language", ddlLanguage.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@edition", TextBox5.Text.Trim());
                cmd.Parameters.AddWithValue("@book_cost", TextBox6.Text.Trim());
                cmd.Parameters.AddWithValue("@no_of_pages", TextBox7.Text.Trim());
                cmd.Parameters.AddWithValue("@book_description", TextBox12.Text.Trim());
                cmd.Parameters.AddWithValue("@actual_stock", TextBox8.Text.Trim());
                cmd.Parameters.AddWithValue("@current_stock", TextBox9.Text.Trim());
                cmd.Parameters.AddWithValue("@book_img_link", filepath);
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Book added successfully.');</script>");
                // GridView1.DataBind();

            }
            catch (Exception ex)
            {

            }
        }


    }
}