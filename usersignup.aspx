<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="usersignup.aspx.cs" Inherits="WebApplication1.usersignup" %>
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
                            <h3>User Sign Up</h3>
                        </center>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <hr />
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <label>Full Name</label>
                        <div class="form-group">
                            <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="Full Name"></asp:TextBox>
                            <br />
                        </div>
                    </div>
                    <div class="col-md-6">
                        <label>Date Of Birth</label>
                        <div class="form-group">
                            <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="" TextMode="Date"></asp:TextBox>
                            <br />
                        </div>

                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6">
                        <label>Contact Number</label>
                        <div class="form-group">
                            <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" placeholder="Contact Number" TextMode="Number"></asp:TextBox>
                            <br />
                        </div>
                    </div>
                    <div class="col-md-6">
                        <label>Email Id</label>
                        <div class="form-group">
                            <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server" placeholder="Email Id" TextMode="Email"></asp:TextBox>
                            <br />
                        </div>

                    </div>
                </div>

                <div class="row">
                    <div class="col-md-4">
                        <label>State</label>
                        <asp:DropDownList ID="ddlStates" class="form-control" runat="server">
                            <asp:ListItem Text="Select State" Value=""></asp:ListItem>
                            <asp:ListItem Text="Andhra Pradesh" Value="Andhra Pradesh"></asp:ListItem>
                            <asp:ListItem Text="Arunachal Pradesh" Value="Arunachal Pradesh"></asp:ListItem>
                            <asp:ListItem Text="Assam" Value="Assam"></asp:ListItem>
                            <asp:ListItem Text="Bihar" Value="Bihar"></asp:ListItem>
                            <asp:ListItem Text="Chhattisgarh" Value="Chhattisgarh"></asp:ListItem>
                            <asp:ListItem Text="Goa" Value="Goa"></asp:ListItem>
                            <asp:ListItem Text="Gujarat" Value="Gujarat"></asp:ListItem>
                            <asp:ListItem Text="Haryana" Value="Haryana"></asp:ListItem>
                            <asp:ListItem Text="Himachal Pradesh" Value="Himachal Pradesh"></asp:ListItem>
                            <asp:ListItem Text="Jharkhand" Value="Jharkhand"></asp:ListItem>
                            <asp:ListItem Text="Karnataka" Value="Karnataka"></asp:ListItem>
                            <asp:ListItem Text="Kerala" Value="Kerala"></asp:ListItem>
                            <asp:ListItem Text="Madhya Pradesh" Value="Madhya Pradesh"></asp:ListItem>
                            <asp:ListItem Text="Maharashtra" Value="Maharashtra"></asp:ListItem>
                            <asp:ListItem Text="Manipur" Value="Manipur"></asp:ListItem>
                            <asp:ListItem Text="Meghalaya" Value="Meghalaya"></asp:ListItem>
                            <asp:ListItem Text="Mizoram" Value="Mizoram"></asp:ListItem>
                            <asp:ListItem Text="Nagaland" Value="Nagaland"></asp:ListItem>
                            <asp:ListItem Text="Odisha" Value="Odisha"></asp:ListItem>
                            <asp:ListItem Text="Punjab" Value="Punjab"></asp:ListItem>
                            <asp:ListItem Text="Rajasthan" Value="Rajasthan"></asp:ListItem>
                            <asp:ListItem Text="Sikkim" Value="Sikkim"></asp:ListItem>
                            <asp:ListItem Text="Tamil Nadu" Value="Tamil Nadu"></asp:ListItem>
                            <asp:ListItem Text="Telangana" Value="Telangana"></asp:ListItem>
                            <asp:ListItem Text="Tripura" Value="Tripura"></asp:ListItem>
                            <asp:ListItem Text="Uttar Pradesh" Value="Uttar Pradesh"></asp:ListItem>
                            <asp:ListItem Text="Uttarakhand" Value="Uttarakhand"></asp:ListItem>
                            <asp:ListItem Text="West Bengal" Value="West Bengal"></asp:ListItem>
                        </asp:DropDownList>

                    </div>

                    <div class="col-md-4">
                        <label>City</label>
                        <div class="form-group">
                            <asp:TextBox CssClass="form-control" ID="TextBox6" runat="server" placeholder="City"></asp:TextBox>
                        </div>

                    </div>
                    <div class="col-md-4">
                        <label>Pin Code</label>
                        <div class="form-group">
                            <asp:TextBox CssClass="form-control" ID="TextBox7" runat="server" placeholder="Pin Code" TextMode="Number"></asp:TextBox>

                        </div>

                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <label>Full Address</label>
                        <div class="form-group">
                            <asp:TextBox CssClass="form-control" ID="TextBox8" runat="server" placeholder="Full Address" TextMode="MultiLine"></asp:TextBox>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <center>
                        <div class="col">
                            <span class="badge text-bg-info">Login Credentials</span>
                        </div>
                    </center>
                </div>

                <div class="row">
                    <div class="col-md-6">
                        Member Id
                        <div class="form-group">
                            <asp:TextBox CssClass="form-control" ID="TextBox9" runat="server" placeholder="User Id"></asp:TextBox>
                            <br />
                        </div>
                    </div>
                    <div class="col-md-6">
                        <label>Password</label>
                        <div class="form-group">
                            <asp:TextBox CssClass="form-control" ID="TextBox10" runat="server" placeholder="Password" TextMode="Password"></asp:TextBox>
                            <br />
                        </div>

                    </div>
                </div>

                <div class="row">
                    <div class="col">

                        <div class="form-group">
                            <asp:Button ID="Button1" class="btn btn-success btn-block btn-lg" runat="server" Text="Sign Up" OnClick="Button1_Click" />
                        </div>
                        <br />
                        <br />

                    </div>
                </div>


            </div>

            <a href="homepage.aspx"><< Back to Home</a><br />
            <br />


        </div>
    </div>

</asp:Content>
