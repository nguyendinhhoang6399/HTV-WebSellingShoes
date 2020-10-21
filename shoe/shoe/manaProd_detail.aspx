<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="manaProd_detail.aspx.cs" Inherits="shoe.manaProd_detail" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="container mt-3">
                <div class="row">
                      <div class="col-md-4 text-center">
                     <a href="index.aspx">
                        <img src="img/logo1.JPG" class="text-left" alt="logo" width="100" height="100" />
                        <img src="img/logoText.JPG" class="text-left" alt="text" width="170" height="170" />
                      </a>
                    </div>
                    <div class="col-md-4 text-center">
                        <h1 class="mt-5 text-warning">Manage Product Detail</h1>
                    </div>
                </div>
                <asp:LinkButton ID="lbThemSp" runat="server" Font-Bold="True" ForeColor="Black" BorderColor="Black" OnClick="lbThemSp_Click">Thêm Sản Phẩm</asp:LinkButton>
            </div>
        </div>
        <div class="container mt-3">
            <asp:GridView ID="GrvCTSP" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Height="349px" Width="850px" OnPageIndexChanging="GrvCTSP_PageIndexChanging" OnRowCancelingEdit="GrvCTSP_RowCancelingEdit" OnRowDeleting="GrvCTSP_RowDeleting" OnRowEditing="GrvCTSP_RowEditing" OnRowUpdating="GrvCTSP_RowUpdating" OnSelectedIndexChanged="GrvCTSP_SelectedIndexChanged">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="MaSp" HeaderText="Mã Sản Phẩm" ReadOnly="True">
                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="Màu sắc" SortExpression="MauSac">
                        <EditItemTemplate>
                            <asp:Label ID="lbMauSac" runat="server" Text='<%# Eval("MauSac") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("MauSac") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Size" SortExpression="name">
                        <EditItemTemplate>
                            <asp:Label ID="lbSize" runat="server" Text='<%# Eval("name") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("name") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                   <asp:TemplateField HeaderText="Ảnh" SortExpression="anh">
                        <EditItemTemplate>
                            <asp:FileUpload ID="UploadImg" runat="server" />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Image ID="FileUpload2" runat="server" ImageUrl='<%# Bind("anh") %>' Height="300px" Width="300px" />
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Giá Bán" SortExpression="GiaBan">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtGiaBan" runat="server" Text='<%# Bind("GiaBan") %>' TextMode="Number"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("GiaBan") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Số lượng" SortExpression="SoLuongTon">
                        <EditItemTemplate>
                            <asp:TextBox ID="txSoLuongUp" runat="server" Text='<%# Bind("SoLuongTon") %>' TextMode="Number"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("SoLuongTon") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:CommandField HeaderText="Sửa" ShowEditButton="True">
                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:CommandField>
                    <asp:CommandField HeaderText="Xóa" ShowDeleteButton="True">
                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:CommandField>
                </Columns>
                <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                <SortedAscendingCellStyle BackColor="#FDF5AC" />
                <SortedAscendingHeaderStyle BackColor="#4D0000" />
                <SortedDescendingCellStyle BackColor="#FCF6C0" />
                <SortedDescendingHeaderStyle BackColor="#820000" />
            </asp:GridView>
        </div>
        <!--Modal them sp-->
        <div class="modal fade" id="addProduct">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5>Thêm sản phẩm</h5>
                        <button class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body">
                        <form>
                            <div class="form-group">
                                <label>Màu Sắc</label>
                                <asp:TextBox CssClass="form-control" ID="txMauSac" placeholder="Nhập Màu Sắc" runat="server"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label>Size</label>
                                <asp:DropDownList CssClass="form-control" ID="DropSize" runat="server"></asp:DropDownList>
                            </div>
                            <div class="form-group">
                                <label>Giá Bán</label>
                                <asp:TextBox CssClass="form-control" ID="txGiaBan" placeholder="Nhập Giá bán" runat="server"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label>Số Lượng</label>
                                <asp:TextBox CssClass="form-control" ID="txSoLuong" placeholder="Nhập Số Lượng" runat="server"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label>Hình Ảnh</label>
                                <asp:FileUpload ID="UploadImg" runat="server" />
                                <asp:Image ID="Image1" runat="server" Width="70px" />
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <asp:Button ID="btnThem" CssClass="btn btn-info" runat="server" Text="ADD" OnClick="btnThem_Click" />
                        <button class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                    </div>
                </div>
            </div>
        </div>

        <asp:LinkButton ID="btnAdd" runat="server"
            BorderWidth="2px"
            Font-Bold="True" Font-Size="Medium" ForeColor="Black" data-toggle="modal"
            data-target="#addProduct" Enabled="false" />
                    

        <script type="text/javascript">
            //function ShowPopup() {
            //    $("#btnShowPopup").click();
            //}
            function ShowAdd() {
                $("#btnAdd").click();
            }
            function showalert() {
                $("#showalert").click();
            }
            //function showPro() {
            //    document.getElementById('product').scrollIntoView(true);
            //}
        </script>
        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </form>
</body>
</html>
