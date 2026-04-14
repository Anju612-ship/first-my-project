<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="adminusermanagement.aspx.cs" Inherits="WebApplication1.adminusermanagement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script type="text/javascript">
    $(document).ready(function () {
        $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
    });
   
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="lblmsg" runat="server" ForeColor="Red" Visible="False">Invalid Credentials</asp:Label>
    <div class="container">
    <div class="row">
        <div class="col-md-6">
            <div class="card">
                <div class="row">
                    <div class="col">
                        <center>
                            <h3>Member Details</h3>
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
                    <div class="col-md-3">
                        <label>Member ID</label>
                        <div class="form-group">
                            <div class="input-group">
                                <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="Member ID"></asp:TextBox>
                                <asp:LinkButton ID="LinkButton4" class="btn btn-primary" runat="server" OnClick="LinkButton4_Click"><i class="fas fa-check-circle"></i></asp:LinkButton>
                                

                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <label>Full Name</label>
                        <div class="form-group">                            
                                <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Full Name"></asp:TextBox>
                                <br />                            
                        </div>
                    </div>
                    <div class="col-md-5">
                        <label>Account Status</label>
                        <div class="form-group">
                            <div class="input-group">
                                <asp:TextBox CssClass="form-control" ID="TextBox7" runat="server" ReadOnly="true" placeholder="Account Status"></asp:TextBox>
                                <asp:LinkButton ID="LinkButton1" class="btn btn-success mr-1" ReadOnly="true" runat="server" OnClick="LinkButton1_Click"><i class="fas fa-check-circle"></i></asp:LinkButton>
                                <asp:LinkButton ID="LinkButton2" class="btn btn-warning mr-1" runat="server" OnClick="LinkButton2_Click"><i class="far fa-pause-circle"></i></asp:LinkButton>
                                <asp:LinkButton ID="LinkButton3" class="btn btn-danger mr-1" runat="server" OnClick="LinkButton3_Click"><i class="fas fa-times-circle"></i></asp:LinkButton>

                                <br />
                            </div>
                        </div>

                    </div>
                </div>
               
                <div class="row">
                    <div class="col-md-4">
                        <label>DOB</label>                        
                            <div class="form-group">
                                <asp:TextBox CssClass="form-control" ID="TextBox8" runat="server" placeholder="DOB"></asp:TextBox>
                            </div>
                        
                    </div>
                    <div class="col-md-4">
                        <label>Contact Number</label>
                        <div class="form-group">
                            <asp:TextBox CssClass="form-control" ID="TextBox9" runat="server" placeholder="Contact Number"></asp:TextBox>
                            <br />
                        </div>
                    </div>
                    <div class="col-md-4">
                        <label>Email ID</label>
                        <div class="form-group">                            
                                <asp:TextBox CssClass="form-control" ID="TextBox10" runat="server" placeholder="Email ID"></asp:TextBox>
                                <br />                            
                        </div>
                    </div>
                </div>
               
                <div class="row">
                    <div class="col-md-4">
                        <label>State</label>
                        <div class="form-group">
                            <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" placeholder="State"></asp:TextBox>
                        </div>

                    </div>
                    <div class="col-md-4">
                        <label>City</label>
                        <div class="form-group">
                            <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server" placeholder="City"></asp:TextBox>
                            <br />
                        </div>
                    </div>
                    <div class="col-md-4">
                        <label>Pin Code</label>
                        <div class="form-group">
                            <asp:TextBox CssClass="form-control" ID="TextBox11" runat="server" placeholder="Pin Code"></asp:TextBox>
                            <br />
                        </div>
                    </div>
                </div>
               <div class="row">
                   <div class="col">
                       <label>Full Postal Address</label>
                       <asp:TextBox CssClass="form-control" ID="TextBox5" runat="server" placeholder="Product Description" TextMode="MultiLine"></asp:TextBox>
                            
                   </div>
               </div>
                <div class="row">
                    <div class="col">
                        <asp:Button ID="Button1" class="btn btn-danger" runat="server" Text="Delete User Parmanently" OnClick="Button1_Click" />

                    </div>
                                           
                    <br />
                    <br />
                    <br />
                </div>
            </div>

            <a href="homepage.aspx"><< Back to Home</a><br />
            <br />
        </div>

        <div class="col-md-6">
            <div class="card">
                <div class="row">
                </div>
                <div class="row">
                    <div class="col">
                        <center>
                            <h3>Member List</h3>
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
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:elibraryDBConnectionString2 %>" ProviderName="<%$ ConnectionStrings:elibraryDBConnectionString2.ProviderName %>" SelectCommand="SELECT * FROM [member_master_tbl]"></asp:SqlDataSource>

                        <asp:GridView class="table table-striped table-bordered" runat="server" ID="Gridview1" AutoGenerateColumns="False" DataKeyNames="member_id" DataSourceID="SqlDataSource1">
                            <Columns>
                                <asp:BoundField DataField="member_id" HeaderText="Member ID" SortExpression="member_id" />
                                <asp:BoundField DataField="full_name" HeaderText="Name" SortExpression="full_name" />
                                <asp:BoundField DataField="account_status" HeaderText="Account Status" SortExpression="account_status" />
                                <asp:BoundField DataField="contanct_no" HeaderText="Contact" SortExpression="contanct_no" />
                                <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email" />
                                <asp:BoundField DataField="state" HeaderText="State" SortExpression="state" />
                                <asp:BoundField DataField="city" HeaderText="City" SortExpression="city" />
                                
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>

        </div>

    </div>
</div>



</asp:Content>
