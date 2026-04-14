<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="adminpublishermanagement.aspx.cs" Inherits="WebApplication1.adminpublishermanagement" %>
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
                                <h3>Publisher Details</h3>
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
                            <label>Publisher ID</label>
                            <div class="form-group">
                                <div class="input-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="ID"></asp:TextBox>
                                    <asp:Button ID="Button2" runat="server" Text="Go" />

                                </div>
                            </div>
                        </div>
                        <div class="col-md-8">
                            <label>Publisher Name</label>
                            <div class="form-group">
                                <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Publisher Name"></asp:TextBox>
                                <br />
                            </div>

                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-4">
                            <asp:Button ID="Button1" class="btn btn-lg btn-block btn-success" runat="server" Text="Add" />

                        </div>
                        <div class="col-md-4">
                            <asp:Button ID="Button3" class="btn btn-lg btn-block btn-primary" runat="server" Text="Update" />

                        </div>
                        <div class="col-md-4">
                            <asp:Button ID="Button4" class="btn btn-lg btn-block btn-danger" runat="server" Text="Delete" />

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
                                <h3>Publisher List</h3>
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
                            <asp:GridView class="table table-striped table-bordered" runat="server"></asp:GridView>
                        </div>
                    </div>
                </div>

            </div>

        </div>
    </div>


</asp:Content>
