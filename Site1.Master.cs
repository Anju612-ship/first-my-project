using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string role = Session["role"] as string;

            if (string.IsNullOrEmpty(role))
               // if (Session["role"] == null || Session["role"].ToString() == "")
            {
                LinkButton9.Visible = true; // user login link button
                LinkButton10.Visible = true; // sign up link button

                LinkButton7.Visible = false; // logout link button
                LinkButton8.Visible = false; // hello user link button

                LinkButton6.Visible = true; // admin login link button
                LinkButton1.Visible = false; // author management link button
                LinkButton2.Visible = false; // publisher management link button
                LinkButton3.Visible = false; // book inventory link button
                LinkButton4.Visible = false; // book issuing link button
                LinkButton5.Visible = false; // member management link button

            }
            else if (Session["role"].Equals("user"))
            {
                LinkButton9.Visible = false; // user login link button
                LinkButton10.Visible = false; // sign up link button

                LinkButton7.Visible = true; // logout link button
                LinkButton8.Visible = true; // hello user link button
                LinkButton8.Text = "Hello "+Session["username"].ToString();
                LinkButton6.Visible = true; // admin login link button
                LinkButton1.Visible = false; // author management link button
                LinkButton2.Visible = false; // publisher management link button
                LinkButton3.Visible = false; // book inventory link button
                LinkButton4.Visible = false; // book issuing link button

            }
            else if (Session["role"].Equals("admin"))
            {
                LinkButton9.Visible = false; // user login link button
                LinkButton10.Visible = false; // sign up link button

                LinkButton7.Visible = true; // logout link button
                LinkButton8.Visible = true; // hello user link button
                LinkButton8.Text = "Hello Admin"; 

                LinkButton6.Visible = false; // admin login link button
                LinkButton1.Visible = true; // author management link button
                LinkButton2.Visible = true; // publisher management link button
                LinkButton3.Visible = true; // book inventory link button
                LinkButton4.Visible = true; // book issuing link button

            }
            

        }

        protected void LinkButton6_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminlogin.aspx");
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminauthermanagement.aspx");
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminpublishermanagement.aspx");
        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminbookinventory.aspx");
        }

        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminbooksissuing.aspx");
        }

        protected void LinkButton5_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminusermanagement.aspx");
        }

        protected void LinkButton7_Click(object sender, EventArgs e)
        {
            Session["username"] = "";
            Session["fullname"] = "";
            Session["role"] = "";
            Session["status"] = "";

            LinkButton9.Visible = true; // user login link button
            LinkButton10.Visible = true; // sign up link button

            LinkButton7.Visible = false; // logout link button
            LinkButton8.Visible = false; // hello user link button

            LinkButton6.Visible = true; // admin login link button
            LinkButton1.Visible = false; // author management link button
            LinkButton2.Visible = false; // publisher management link button
            LinkButton3.Visible = false; // book inventory link button
            LinkButton4.Visible = false; // book issuing link button
            LinkButton5.Visible = false; // member management link button


        }
    }
}