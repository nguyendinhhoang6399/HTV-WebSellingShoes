using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace shoe
{
    public partial class manageProduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadDataGV();
                LoadDropLoaiGiay();
                LoadDropNcc();
            }
        }
        void LoadDataGV()
        {
            string sql = "select SP.masp, SP.tensp, ST.name, NCC.TenNhaCC from sanpham SP, ShoeType ST, NhaCungCap NCC " +
                    "where ST.TypeId=SP.TypeId and NCC.id=SP.maNcc";
            DataTable data = KetNoi.Excutequerry(sql);
            grvMana.DataSource = data;
            grvMana.DataBind();
        }
        void LoadDropLoaiGiay()
        {
            string sql = "select * from ShoeType";
            DataTable data = KetNoi.Excutequerry(sql);
            DropLoaiGiay.DataSource = data;
            DropLoaiGiay.DataTextField = "Name";
            DropLoaiGiay.DataValueField = "TypeId";
            DropLoaiGiay.DataBind();
        }
        void LoadDropNcc()
        {
            string sql = "select * from NhaCungCap";
            DataTable data = KetNoi.Excutequerry(sql);
            DropNcc.DataSource = data;
            DropNcc.DataTextField = "TenNhaCC";
            DropNcc.DataValueField = "id";
            DropNcc.DataBind();
        }

        protected void lbThemSp_Click(object sender, EventArgs e)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "alert", "ShowAdd();", true);
        }

        protected void btnThem_Click(object sender, EventArgs e)
        {
            if (txTenSp.Text == String.Empty)
            {
                Response.Write("<script>alert('Hãy nhập đủ dữ liệu!!')</script>");
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "ShowAdd();", true);
            }
            else
            {
                String sql = "Insert into SanPham(tensp,typeid,mancc) values(N'" + txTenSp.Text + "',N'" + DropLoaiGiay.SelectedValue + "',N'" + DropNcc.SelectedValue + "')";
                Response.Write("<script>alert('Thêm thành công!!')</script>");
                DataTable data = KetNoi.Excutequerry(sql);
                LoadDataGV();
            }
        }

        protected void grvMana_SelectedIndexChanged(object sender, EventArgs e)
        {
            string masp = grvMana.SelectedRow.Cells[0].Text;
            Session["MaSp"] = masp;

            Response.Redirect("manaProd_detail.aspx");
        }
    }
}