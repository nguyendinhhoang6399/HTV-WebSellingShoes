using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace shoe
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                loadData();
               
            }
        }
        void loadData()
        {
            String sql = "  select DISTINCT S.maSP,S.TenSP,C.MauSac,C.anh from CTSP C,SanPham S where C.maSP = S.MaSP";
            DataTable data = KetNoi.Excutequerry(sql);
            DataList1.DataSource = data;
            DataList1.DataBind();
        }
        void LoadGia(int masp,string mau,int size) 
        {
            string sql = "Select GiaBan from CTSP where MaSp='" + masp + "' and MauSac=N'" + mau + "' and maSize='" + size + "'";
            DataTable data = KetNoi.Excutequerry(sql);
            foreach(DataRow item in data.Rows)
            {
                lbGia.Text = item["GiaBan"].ToString();
            }
        }
        void LoadSize(int maSP,string Mau) 
        {
            //cbSize.Items.Add(new ListItem(""));
            cbSize.Items.Clear();
             cbSize.Items.Add(new ListItem("","-1"));
                string sql = "Select sizeId,name from Size,CTSP C where C.maSize=Size.sizeId and C.MaSp='" + maSP + "' " +
                    "and C.MauSac=N'" + Mau + "'";
                DataTable data = KetNoi.Excutequerry(sql);
                cbSize.DataSource = data;
                cbSize.DataValueField = "sizeId";
                cbSize.DataTextField = "name";
                
                cbSize.DataBind();
           
        }
        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (Session["cart"] == null)
            {
                Response.Write("<script>alert('Vui Lòng đăng nhập')</script>");
            }
            else
            {
                Label lbMau = null;
                Label lbTenSP = null;
                DataList1.SelectedIndex = e.Item.ItemIndex;
                lbMau = DataList1.SelectedItem.FindControl("lbMau") as Label;
                lbTenSP = DataList1.SelectedItem.FindControl("lbTenSp") as Label;
                Label lbMaSp = DataList1.SelectedItem.FindControl("lbMaSp") as Label;
                lbT.Text = lbTenSP.Text;
                lbM.Text = lbMau.Text;
                LoadSize(int.Parse(lbMaSp.Text), lbMau.Text);
                cbSize.SelectedIndex = 0;
                lbMaGiay.Text = lbMaSp.Text;
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "ShowPopup();", true);
            }
        }

        protected void cbSize_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cbSize.SelectedValue != "-1")
            {
                LoadGia(int.Parse(lbMaGiay.Text), lbM.Text, int.Parse(cbSize.SelectedValue));
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "ShowPopup();", true);
            }
            else
            {
                lbGia.Text = String.Empty;
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "ShowPopup();", true);
            }
            

        }

        protected void btnCart_Click(object sender, EventArgs e)
        {
            if (txSoLuong.Text == String.Empty || cbSize.SelectedValue == "-1")
            {
                Response.Write("<script>alert('Nhập đủ dữ liệu!!')</script>");
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "ShowPopup();", true);
            }

            else
            {
                Response.Write("<script>alert('Thêm Thành Công')</script>");
                lbGia.Text = String.Empty;
            }
        }

        protected void lbDangNhap_Click(object sender, EventArgs e)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "alert", "ShowLogin();", true);
        }
    }
}