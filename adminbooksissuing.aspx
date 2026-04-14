<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="adminbooksissuing.aspx.cs" Inherits="WebApplication1.adminbooksissuing" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">
        <div class="row">
            <div class="col-md-5">
                <div class="card">
                    <div class="row">
                        <div class="col">
                            <center>
                                <h3>Book Issuing</h3>
                            </center>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <center>
                                <img src="images/userimg.png" style="width: 150px;" />

                            </center>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-4">
                            <label>Member ID</label>
                            <div class="form-group">
                                <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="Member ID"></asp:TextBox>

                            </div>
                        </div>
                        <div class="col-md-8">
                            <label>Book ID</label>
                            <div class="form-group">
                                <div class="input-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Book ID"></asp:TextBox>
                                    <asp:Button ID="Button2" class="btn btn-dark" runat="server" Text="Go" OnClick="Button2_Click" />
                                    <br />
                                </div>
                            </div>

                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-4">
                            <label>Member Name</label>
                            <div class="form-group">
                                <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" placeholder="Member Name" Enabled="False"></asp:TextBox>

                            </div>
                        </div>
                        <div class="col-md-8">
                            <label>Book Name</label>
                            <div class="form-group">
                                <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server" placeholder="Book Name" Enabled="False"></asp:TextBox>
                                <br />

                            </div>

                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-4">
                            <label>Start Date</label>
                            <div class="form-group">
                                <asp:TextBox CssClass="form-control" ID="TextBox5" runat="server" placeholder="Start Date" TextMode="Date"></asp:TextBox>

                            </div>
                        </div>
                        <div class="col-md-8">
                            <label>End Date</label>
                            <div class="form-group">                                
                                    <asp:TextBox CssClass="form-control" ID="TextBox6" runat="server" placeholder="End Date" TextMode="Date"></asp:TextBox>
                                    
                                    <br />
                                
                            </div>

                        </div>
                    </div>


                    <div class="row">
                        <div class="col-md-4">
                            <asp:Button ID="Button1" class="btn btn-lg btn-block btn-success" runat="server" Text="Issue" OnClick="Button1_Click" />

                        </div>
                        <div class="col-md-4">
                            <asp:Button ID="Button3" class="btn btn-lg btn-block btn-primary" runat="server" Text="Return" OnClick="Button3_Click" />

                        </div>                        
                        <br />
                        <br />
                        <br />
                    </div>
                </div>

                <a href="homepage.aspx"><< Back to Home</a><br />
                <br />
            </div>

            <div class="col-md-7">
                <div class="card">
                    <div class="row">
                    </div>
                    <div class="row">
                        <div class="col">
                            <center>
                                <h3>Issued Book List</h3>
                            </center>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <hr />
                        </div>
                    </div>

                    <div class="row">
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:elibraryDBConnectionString3 %>' SelectCommand="SELECT * FROM [book_issue_tbl]"></asp:SqlDataSource>
                        <div class="col">
                            <asp:GridView class="table table-striped table-bordered" runat="server"></asp:GridView>
                        </div>
                    </div>
                </div>

            </div>

        </div>
    </div>



</asp:Content>
