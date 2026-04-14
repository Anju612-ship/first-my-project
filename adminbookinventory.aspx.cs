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
    public partial class adminbookinventory : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["MyDBConnection"].ConnectionString;
        static string global_filepath;
        static int global_actual_stock, global_current_stock, global_issued_books;

        protected void Page_Load(object sender, EventArgs e)
        {
            fillAuthorPublisherValues();
            GridView1.DataBind();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if(checkIfBookExists())
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
            upateBookByID();
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            deleteBookByID();
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
            catch(Exception ex)
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
                     = new SqlCommand("SELECT * from book_master_tbl where book_id= '" + TextBox1.Text.Trim() + "' OR book_name='"+TextBox2.Text.Trim()+"';", con);
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
                foreach(int i in lstGenre.GetSelectedIndices())
                {
                    genres = genres + lstGenre.Items[i] + ",";
                }
                // genre = Adventure, Self Help,

                genres = genres.Remove(genres.Length - 1);

                string filepath = "~/book_inventory/userimg.png";
                string filename =  Path.GetFileName(FileUpload1.PostedFile.FileName);
                FileUpload1.SaveAs(Server.MapPath("book_inventory/" + filename));
                filepath = "~/book_inventory/" + filename;


                SqlConnection con = new SqlConnection(strcon);
                if(con.State == ConnectionState.Closed)
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
                clearForm();
               GridView1.DataBind();

            }
            catch(Exception ex)
            {

            }
        }
        void getBookByID()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * from book_master_tbl WHERE book_id='"+TextBox1.Text.Trim()+"';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if(dt.Rows.Count >= 1)
                {
                    TextBox2.Text = dt.Rows[0]["book_name"].ToString();
                    TextBox4.Text = dt.Rows[0]["publisher_date"].ToString();
                    TextBox5.Text = dt.Rows[0]["edition"].ToString();
                    TextBox6.Text = dt.Rows[0]["book_cost"].ToString();
                    TextBox7.Text = dt.Rows[0]["no_of_pages"].ToString();
                    TextBox8.Text = dt.Rows[0]["actual_stock"].ToString();
                    TextBox9.Text = dt.Rows[0]["current_stock"].ToString();

                    ddlLanguage.SelectedValue = dt.Rows[0]["language"].ToString();
                    ddlPublisher.SelectedValue = dt.Rows[0]["publisher_name"].ToString();
                    ddlAuthor.SelectedValue = dt.Rows[0]["author_name"].ToString();

                    string[] genre = dt.Rows[0]["genre"].ToString().Trim().Split(',');
                    for(int i =0; i< genre.Length; i++)
                    {
                        for(int j=0; j<lstGenre.Items.Count; j++)
                        {
                            if (lstGenre.Items[j].ToString() == genre[i])
                            {
                                lstGenre.Items [j].Selected = true;
                            }
                        }
                    }
                    global_actual_stock = Convert.ToInt32(dt.Rows[0]["actual_stock"].ToString().Trim());
                    global_current_stock = Convert.ToInt32(dt.Rows[0]["global_current_stock"].ToString().Trim());
                    global_issued_books = Convert.ToInt32(dt.Rows[0]["global_issued_books"].ToString().Trim());
                    global_filepath = dt.Rows[0]["book_img_link"].ToString();


                }
                else
                {
                    Response.Write("<script>alert('Invalid Book ID');</script>");
                }
                
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                
            }


        }

        void upateBookByID()
        {
            if (checkIfBookExists())
            {
                try
                {
                    int actual_stock = Convert.ToInt32(TextBox8.Text.Trim());
                    int current_stock = Convert.ToInt32((TextBox9.Text.Trim()).Trim());

                    if(global_actual_stock == actual_stock)
                    {

                    }
                    else
                    {
                        if (actual_stock < global_issued_books)
                        {
                            Response.Write("<script>alert('Actual value cannot be less than the Issued books');</script>");
                            return;
                        }
                        else 
                        { 
                          current_stock = actual_stock - global_issued_books;
                            TextBox5.Text = "" + current_stock;
                        
                        
                        }
                    }


                    string genres = "";
                    foreach(int i in lstGenre.GetSelectedIndices())
                    {
                        genres = genres + lstGenre.Items[i] + ",";
                    }
                    genres = genres.Remove(genres.Length-1);

                    string filepath = "~/book_inventory/books1";
                    string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
                    FileUpload1.SaveAs(Server.MapPath("book_inventory/" + filename));
                    if (filename == "" || filename == null)
                    {
                        filepath = global_filepath;

                        
                    }
                    else
                    {
                        FileUpload1.SaveAs(Server.MapPath("book_inventory/" + filename));
                        filepath = "~/book_inventory/" + filename;

                    }

                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {

                        con.Open();
                    }
                    SqlCommand cmd = new SqlCommand("UPDATE book_master_tbl SET book_name=@book_name,genre=@genre,author_name=@author_name,publisher_name=@publisher_name,publisher_date= @publisher_date,language=@language,edition=@edition,book_cost=@book_cost,no_of_pages=@no_of_pages,book_description=@book_description,actual_stock=@actual_stock,current_stock=@current_stock,book_img_link=@book_img_link WHERE book_id='" + TextBox1.Text.Trim() + "'", con);

                    cmd.Parameters.AddWithValue("@book_name",TextBox2.Text.Trim());
                    cmd.Parameters.AddWithValue("@genre", genres);
                    cmd.Parameters.AddWithValue("@author_name", ddlAuthor.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@publisher_name", ddlPublisher.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@publisher_date", TextBox4.Text.Trim());
                    cmd.Parameters.AddWithValue("@language", ddlLanguage.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@edition", TextBox5.Text.Trim());
                    cmd.Parameters.AddWithValue("@book_cost", TextBox6.Text.Trim());
                    cmd.Parameters.AddWithValue("@no_of_pages", TextBox7.Text.Trim());
                    cmd.Parameters.AddWithValue("@book_description", TextBox12.Text.Trim());
                    cmd.Parameters.AddWithValue("@actual_stock", actual_stock.ToString());
                    cmd.Parameters.AddWithValue("@current_stock", current_stock.ToString());
                    cmd.Parameters.AddWithValue("@book_img_link", filepath);

                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Write("<script>alert('Book updated Successfully');</script>");
                    clearForm();
                    GridView1.DataBind();
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");


                }

            }

            else
            {
                Response.Write("<script>alert('Invalid book Id');</script>");
            
            }
        }

        void deleteBookByID()
        {
            if (checkIfBookExists())
            {
                try
                {
                    SqlConnection con = new SqlConnection(strcon);
                    if(con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    SqlCommand cmd = new SqlCommand("DELETE FROM book_master_tbl WHERE book_id='" + TextBox1.Text.Trim() + "'", con);
                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Write("<script>alert('Books Deleted Successfully');</script>");
                    clearForm();
                    GridView1.DataBind();


                }
                catch(Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Invalid Book ID');</script>");

            }
        }

        void clearForm()
        {
            TextBox1.Text = "";
            TextBox2.Text = "";
            TextBox4.Text = "";
            TextBox5.Text = "";
            TextBox6.Text = "";
            TextBox7.Text = "";
            TextBox8.Text = "";
            TextBox9.Text = "";
            TextBox11.Text = "";
            TextBox12.Text = "";
        }


        // go button
        protected void Button4_Click(object sender, EventArgs e)
        {
            getBookByID();

        }


    }
}