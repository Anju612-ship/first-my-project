<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="adminauthermanagement.aspx.cs" Inherits="WebApplication1.adminauthermanagement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        });
       
    </script>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="container">
        <div class="row">
            <div class="col-md-5">
                <div class="card">
                    <div class="row">
                        <div class="col">
                            <center>
                                <h3>Author Details</h3>
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
                            <label>Author ID</label>
                            <div class="form-group">
                                <div class="input-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="ID"></asp:TextBox>
                                    <asp:Button ID="Button2" runat="server" Text="Go" OnClick="Button2_Click" />

                                </div>
                            </div>
                        </div>
                        <div class="col-md-8">
                            <label>Author Name</label>
                            <div class="form-group">
                                <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Author Name"></asp:TextBox>
                                <br />
                            </div>

                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-4">
                            <asp:Button ID="Button1" class="btn btn-lg btn-block btn-success" runat="server" Text="Add" OnClick="Button1_Click" />

                        </div>
                        <div class="col-md-4">
                            <asp:Button ID="Button3" class="btn btn-lg btn-block btn-primary" runat="server" Text="Update" OnClick="Button3_Click" />

                        </div>
                        <div class="col-md-4">
                            <asp:Button ID="Button4" class="btn btn-lg btn-block btn-danger" runat="server" Text="Delete" OnClick="Button4_Click" />

                        </div><br /><br /><br />
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
                                <h3>Author List</h3>    
                            </center>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <hr />
                        </div>
                    </div>
                    
                    <div class="row">
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:elibraryDBConnectionString %>" ProviderName="<%$ ConnectionStrings:elibraryDBConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [author_master_tbl]"></asp:SqlDataSource>
                        <div class="col">
                            <asp:GridView class="table table-striped table-bordered" runat="server" ID="GridView1" AutoGenerateColumns="False" DataKeyNames="auther_id" DataSourceID="SqlDataSource1">
                                <Columns>
                                    <asp:BoundField DataField="auther_id" HeaderText="Author Id" ReadOnly="True" SortExpression="auther_id" />
                                    <asp:BoundField DataField="author_name" HeaderText="Author Name" SortExpression="author_name" />
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </div>

            </div>

        </div>
</div>


</asp:Content>
