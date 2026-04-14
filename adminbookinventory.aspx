<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="adminbookinventory.aspx.cs" Inherits="WebApplication1.adminbookinventory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">

        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        });

        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#imgview').attr('src', e.target.result);
                };
                reader.readAsDataURL(input.files[0]);
            }
        }

    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
    <div class="row">
        <div class="col-md-6">
            <div class="card">
                <div class="row">
                    <div class="col">
                        <center>
                            <h3>Books Details</h3>
                        </center>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <center>
                            <img src="images/userimg.png" id="imgview" style="width: 100px; height:150px;" />

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
                        <asp:FileUpload onchange="readURL(this);" class="form-control" ID="FileUpload1" runat="server" />
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-4">
                        <label>Book ID</label>
                        <div class="form-group">
                            <div class="input-group">
                                <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="ID"></asp:TextBox>
                                <asp:Button  ID="Button4" runat="server" Text="Go" OnClick="Button4_Click" />

                            </div>
                        </div>
                    </div>
                    <div class="col-md-8">
                        <label>Book Name</label>
                        <div class="form-group">                            
                                <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Book Name"></asp:TextBox>
                                <br />                            
                        </div>
                    </div>
                    
                </div>
               
                <div class="row">
                    <div class="col-md-4">
                        <label>Languages</label>                        
                            <div class="form-group">
                                <asp:DropDownList ID="ddlLanguage" runat="server" CssClass="form-control">
                                    <asp:ListItem Value="">-- Select Language --</asp:ListItem>
                                    <asp:ListItem Value="English">English</asp:ListItem>
                                    <asp:ListItem Value="Hindi">Hindi</asp:ListItem>
                                    <asp:ListItem Value="Spanish">Spanish</asp:ListItem>
                                    <asp:ListItem Value="French">French</asp:ListItem>
                                    <asp:ListItem Value="German">German</asp:ListItem>
                                    <asp:ListItem Value="Chinese">Chinese</asp:ListItem>
                                    <asp:ListItem Value="Japanese">Japanese</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        
                    </div>
                    <div class="col-md-4">
                        <label>Author Name</label>
                        <div class="form-group">
                            <asp:DropDownList ID="ddlAuthor" runat="server" CssClass="form-control">
                                <asp:ListItem Value="">-- Select Author --</asp:ListItem>
                                <%--<asp:ListItem>William Shakespeare</asp:ListItem>
                                <asp:ListItem>Rabindranath Tagore</asp:ListItem>
                                <asp:ListItem>Premchand</asp:ListItem>
                                <asp:ListItem>Charles Dickens</asp:ListItem>
                                <asp:ListItem>Jane Austen</asp:ListItem>
                                <asp:ListItem>Mark Twain</asp:ListItem>
                                <asp:ListItem>Leo Tolstoy</asp:ListItem>
                                <asp:ListItem>J.K. Rowling</asp:ListItem>
                                <asp:ListItem>Agatha Christie</asp:ListItem>--%>
                            </asp:DropDownList>
                            <br />
                        </div>
                    </div>
                    <div class="col-md-4">
                        <label>Genre</label>
                        <div class="form-group">                            
                            <asp:ListBox ID="lstGenre" runat="server" SelectionMode="Multiple" CssClass="form-control">
                                <asp:ListItem>Fiction</asp:ListItem>
                                <asp:ListItem>Non-Fiction</asp:ListItem>
                                <asp:ListItem>Mystery</asp:ListItem>
                                <asp:ListItem>Thriller</asp:ListItem>
                                <asp:ListItem>Romance</asp:ListItem>
                                <asp:ListItem>Fantasy</asp:ListItem>
                                <asp:ListItem>Science Fiction</asp:ListItem>
                                <asp:ListItem>Horror</asp:ListItem>
                                <asp:ListItem>Biography</asp:ListItem>
                                <asp:ListItem>History</asp:ListItem>
                            </asp:ListBox>     
                                <br />                            
                        </div>
                    </div>
                    
                </div>
               
                <div class="row">
                    <div class="col-md-6">
                        <label>Publish Name</label>
                        <div class="form-group">
                            <asp:DropDownList ID="ddlPublisher" runat="server" CssClass="form-control"></asp:DropDownList>

                            <%--<asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" placeholder="Publish Name"></asp:TextBox>--%>
                        </div>

                    </div>
                    <div class="col-md-6">
                        <label>Publish Date</label>
                        <div class="form-group">
                            <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server" placeholder="Publish Date" TextMode="Date"></asp:TextBox>
                            <br />
                        </div>
                    </div>
                    
                </div>
               <div class="row">
                   <div class="col-md-4">
                       <label>Edition</label>
                       <asp:TextBox CssClass="form-control" ID="TextBox5" runat="server" placeholder="Edition"></asp:TextBox>
                            
                   </div>
                   <div class="col-md-4">
                       <label>Book Cost(per unit)</label>
                       <asp:TextBox CssClass="form-control" ID="TextBox6" runat="server" placeholder="Book Cost"></asp:TextBox>

                   </div>
                   <div class="col-md-4">
                       <label>Pages</label>
                       <asp:TextBox CssClass="form-control" ID="TextBox7" runat="server" placeholder="Pages"></asp:TextBox>

                   </div>
               </div>
               
                <div class="row">
                    <div class="col-md-4">
                        <label>Actual Stock</label>
                        <asp:TextBox CssClass="form-control" ID="TextBox8" runat="server" placeholder="Actual Stock"></asp:TextBox>

                    </div>
                    <div class="col-md-4">
                        <label>Current Stock</label>
                        <asp:TextBox CssClass="form-control" ID="TextBox9" runat="server" placeholder="Current Stock"></asp:TextBox>

                    </div>
                    <div class="col-md-4">
                        <label>Issued Books</label>
                        <asp:TextBox CssClass="form-control" ID="TextBox11" runat="server" placeholder="Issued Books"></asp:TextBox>

                    </div>
                </div>
               
                <div class="col">
                    <label>Book Description</label>
                    <div class="form-group">
                        <asp:TextBox CssClass="form-control" ID="TextBox12" runat="server" placeholder="Book Description" TextMode="MultiLine"></asp:TextBox>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-4">
                        <asp:Button ID="Button1" class="btn btn-success" runat="server" Text="Add" OnClick="Button1_Click"/>

                    </div>
                    <div class="col-md-4">
                        <asp:Button ID="Button2" class="btn btn-info" runat="server" Text="Update" OnClick="Button2_Click"/>

                    </div>
                    <div class="col-md-4">
                        <asp:Button ID="Button3" class="btn btn-danger" runat="server" Text="Delete" OnClick="Button3_Click"/>

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
                            <h3>Book Inventory List</h3>
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
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:elibraryDBConnectionString %>" SelectCommand="SELECT * FROM [book_master_tbl]"></asp:SqlDataSource>
                        <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="book_id" DataSourceID="SqlDataSource1" Width="506px">
                            <Columns>
                                <asp:BoundField DataField="book_id" HeaderText="book_id" ReadOnly="True" SortExpression="book_id" />
                                
                                <asp:TemplateField>                                   
                                    <ItemTemplate>
                                        <div class="container-fluid">
                                            <div class="row">
                                                <div class="col-lg-10">
                                                    <div class="row">
                                                        <div class="col-12">
                                                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("book_name") %>' Font-Bold="True" Font-Size="X-Large"></asp:Label>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-12">
                                                            Author-<asp:Label ID="Label2" runat="server" Font-Bold="True" Text='<%# Eval("author_name") %>'></asp:Label>
                                                            &nbsp;| Genre-<asp:Label ID="Label3" runat="server" Font-Bold="True" Text='<%# Eval("genre") %>'></asp:Label>
                                                            &nbsp;| Language-<asp:Label ID="Label4" runat="server" Font-Bold="True" Text='<%# Eval("language") %>'></asp:Label>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-12">
                                                            Publisher-<asp:Label ID="Label5" runat="server" Font-Bold="True" Text='<%# Eval("publisher_name") %>'></asp:Label>
                                                            &nbsp;| Publish Date-
                                                            <asp:Label ID="Label6" runat="server" Font-Bold="True" Text='<%# Eval("publisher_date") %>'></asp:Label>
                                                            &nbsp;| Pages-<asp:Label ID="Label7" runat="server" Font-Bold="True" Text='<%# Eval("no_of_pages") %>'></asp:Label>
                                                            &nbsp;| Edition-
                                                            <asp:Label ID="Label8" runat="server" Font-Bold="True" Text='<%# Eval("edition") %>'></asp:Label>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-12">
                                                            Cost-<asp:Label ID="Label9" runat="server" Font-Bold="True" Text='<%# Eval("book_cost") %>'></asp:Label>
                                                            &nbsp;| Actual Stock-<asp:Label ID="Label10" runat="server" Font-Bold="True" Text='<%# Eval("actual_stock") %>'></asp:Label>
                                                            &nbsp;| Available-
                                                            <asp:Label ID="Label11" runat="server" Font-Bold="True" Text='<%# Eval("current_stock") %>'></asp:Label>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-12">
                                                            Description-<asp:Label ID="Label12" runat="server" Font-Bold="True" Text='<%# Eval("book_description") %>'></asp:Label>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-2">
                                                    <asp:Image ID="Image1" class="img-fluid" runat="server" ImageUrl='<%# Eval("book_img_link") %>' />
                                                
                                                </div>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>

        </div>

    </div>
</div>


</asp:Content>
