<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AdminLogin.aspx.cs" Inherits="WebApplication1.AdminLogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div class="container">
        <asp:Label ID="lblmsg" runat="server" ForeColor="Red" Visible="False">Invalid Credentials</asp:Label>
    <div class="col-md-6 mx-auto">
        <div class="card">
            <div class="row">
                <div class="col">
                    <center>
                        <img src="images/userimg.png" style="width: 150px;" />
                    </center>
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <center>
                        <h3>Admin Login</h3>
                    </center>
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <hr />
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <div class="form-group">
                        <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="Admin ID"></asp:TextBox>
                        <br />
                    </div>
                    <div class="form-group">
                        <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Password" TextMode="Password"></asp:TextBox>
                        <br />
                    </div>
                    <div class="form-group">
                        <asp:Button ID="Button1" class="btn btn-success btn-block btn-lg" runat="server" Text="Login" OnClick="Button1_Click" />
                    </div>
                    <br />
                    <br />

                </div>
            </div>


        </div>

        <a href="homepage.aspx"><< Back to Home</a><br /><br />


    </div>
</div>



</asp:Content>
