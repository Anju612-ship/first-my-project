<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="userlogin.aspx.cs" Inherits="WebApplication1.userlogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
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
                            <h3>Member Login</h3>
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
                        <label>Member ID</label>
                        <div class="form-group">
                            <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="Member ID"></asp:TextBox>
                        </div>
                    </div>
                    <label>Password</label>
                    <div class="form-group">
                        <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Password" TextMode="Password"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:Button ID="Button1" class="btn btn-success btn-block btn-lg" runat="server" Text="Login" OnClick="Button1_Click" />
                    </div>
                    <br /><br />
                    <div class="form-group">
                       <a href="usersignup.aspx"><input id="Button2" class="btn btn-info btn-block btn-lg" type="button" value="Sign Up" /></a> 
                    </div><br />
                </div>
            </div>

            <a href="homepage.aspx"><< Back to Home</a><br /><br />
            <asp:Label ID="lblmsg" runat="server" ForeColor="Red" Visible="False">Invalid Credentials</asp:Label>

        </div>
    </div>


</asp:Content>
