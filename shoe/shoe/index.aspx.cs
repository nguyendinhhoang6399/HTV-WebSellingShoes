using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace shoe
{
    public partial class index : System.Web.UI.Page
    {
        static int curentposition = 0;
        static int totalrow = 0;
        static string user = "";
        
        protected void Page_Load(object sender, EventArgs e)
        {
           
            
            if (!IsPostBack)
            {
                loadData();
                loadBest();
                loadNew();
                lbDangNhap.Visible = true;
                cbUser.Visible = false;
               

            }
            else
            {
                
            }
            
        }
        void loadNew()
        {
            string sql = "select DISTINCT  top 4   S.maSP,S.TenSP,C.MauSac,C.anh from CTSP C,SanPham S where C.maSP = S.MaSP order by S.MaSP DESC";
            DataTable data = KetNoi.Excutequerry(sql);
            grnew.DataSource = data;
            grnew.DataBind();
        }
        void loadBest()
        {
            string sql = "select DISTINCT  top 4 S.maSP,S.TenSP,C.MauSac,C.anh from CTSP C,SanPham S where C.maSP = S.MaSP ";
            DataTable data = KetNoi.Excutequerry(sql);
            grBest.DataSource = data;
            grBest.DataBind();
        }
        void loadData()
        {
            PagedDataSource pg = new PagedDataSource();
            String sql = "  select DISTINCT S.maSP,S.TenSP,C.MauSac,C.anh from CTSP C,SanPham S where C.maSP = S.MaSP and S.TenSP like N'%"+user+"%'";
            DataTable data = KetNoi.Excutequerry(sql);
            pg.AllowPaging = true;
            pg.DataSource = data.DefaultView;
            totalrow = data.Rows.Count;
            pg.CurrentPageIndex = curentposition;
            pg.PageSize = 8;
            btnPrev.Enabled = !pg.IsFirstPage;
            btnNext.Enabled = !pg.IsLastPage;
            DataList1.DataSource = pg;
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
        string getUserId(string userName)
        {
            string sql = "Select UserId from users where userName='" + userName + "'";
            DataTable data = KetNoi.Excutequerry(sql);
            foreach (DataRow row in data.Rows)
                return row["UserId"].ToString();
            return "";
        }
        string getCartId(string userId)
        {
            string sql = "Select cartId from Cart where userId='" + userId + "'";
            DataTable data = KetNoi.Excutequerry(sql);
            foreach (DataRow row in data.Rows)
                return row["cartId"].ToString();
            return "";
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
        bool kiemTraTonTai(string cartId,string maSp,string maSize,string MauSac)
        {
            string sql = "Select * from cartDetail where cartId='"+cartId+"' and maSp='" + maSp + "' and sizeId='" + maSize + "' and MauSac=N'" + MauSac + "'";
            DataTable data = KetNoi.Excutequerry(sql);
            if (data.Rows.Count > 0)
                return true;
            return false;
        }

        protected void btnCart_Click(object sender, EventArgs e)
        {
            if (txSoLuong.Text == String.Empty || cbSize.SelectedValue == "-1")
            {
                Response.Write("<script>alert('Hãy nhập đủ dữ liệu')</script>");
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "ShowPopup();", true);
            }

            else
            {
                string sql = "";
                string cartId = Session["cart"] as string;
                if (kiemTraTonTai(cartId, lbMaGiay.Text, cbSize.SelectedValue, lbM.Text))
                {
                    sql = "Update cartDetail set soLuong=soLuong+" + txSoLuong.Text + " where " +
                        "cartId='" + cartId + "' and maSp='" + lbMaGiay.Text + "' and sizeId='" + cbSize.SelectedValue + "' and MauSac=N'" + lbM.Text + "'";
                }
                else
                {

                    sql = "insert into cartDetail values('" + cartId + "','" + lbMaGiay.Text + "','" + cbSize.SelectedValue + "'" +
                        ",N'" + lbM.Text + "','" + txSoLuong.Text + "','" + lbGia.Text + "')";
                }
                 DataTable data = KetNoi.Excutequerry(sql);

                Response.Write("<script>alert('Thêm thành công')</script>");
                lbGia.Text = String.Empty;
            }
        }

        protected void lbDangNhap_Click(object sender, EventArgs e)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "alert", "ShowLogin();", true);
            //Response.Write("<script> alert('Xóa thành công') </script>");
           

        }
        bool kiemTraDangNhap(string userName, string passWord)
        {
            string sql= "Select * from Users where UserName='"+userName+"' and MatKhau='"+passWord+"'";
            DataTable data = KetNoi.Excutequerry(sql);
            if (data.Rows.Count > 0)
                return true;
            return false;
        }

        protected void btnDangNhap_Click(object sender, EventArgs e)
        {
           
            if(txUserName.Text==String.Empty || txPassWord.Text == String.Empty)
            {
                Response.Write("<script>alert('Hãy nhập đủ dữ liệu!!')</script>");
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "ShowLogin();", true);

            }
            else
            {
                if (kiemTraDangNhap(txUserName.Text, txPassWord.Text))
                {

                    Response.Write("<script>alert('Đăng nhập thành công')</script>");

                    lbDangNhap.Visible = false;
                    cbUser.Visible = true;
                    cbUser.BorderStyle = BorderStyle.None;
                    cbUser.Items.Add(new ListItem(""+txUserName.Text+"", "-1"));
                    cbUser.Items.Add(new ListItem("logout", "1"));
                    string userId = getUserId(txUserName.Text);
                    Session["cart"] = getCartId(userId);
                }
                else
                {
                    Response.Write("<script>alert('Tên đăng nhập hoặc mật khẩu không đúng')</script>");

                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "ShowLogin();", true);
                }

            }
        }

        protected void btnPrev_Click(object sender, EventArgs e)
        {
            curentposition -= 1;
            loadData();
            ClientScript.RegisterStartupScript(this.GetType(), "alert", "showPro();", true);
        }

        protected void btnNext_Click(object sender, EventArgs e)
        {
            if (curentposition == totalrow - 1)
            {

            }
            else
            {
                curentposition += 1;
               
                loadData();
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "showPro();", true);
            }
        }

        protected void lbCart_Click(object sender, EventArgs e)
        {
            if (Session["cart"] == null)
            {
                Response.Write("<script>alert('Vui Lòng Đăng nhập')</script>");
               
            }
            else
            {
                Response.Redirect("cart.aspx");
            }
        }


        protected void LinkButton1_Click1(object sender, EventArgs e)
        {
            user = "Nam";
            loadData();
            ClientScript.RegisterStartupScript(this.GetType(), "alert", "showProduc();", true);
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            user = "Nữ";
            loadData();
            ClientScript.RegisterStartupScript(this.GetType(), "alert", "showProduc();", true);
        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            user = "trẻ Em";
            loadData();
            ClientScript.RegisterStartupScript(this.GetType(), "alert", "showProduc();", true);
        }

        protected void cbUser_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cbUser.SelectedIndex == 1)
            {
                Session["cart"] = null;
                cbUser.Visible = false;
                lbDangNhap.Visible = true;
            }
        }

        protected void grnew_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (Session["cart"] == null)
            {
                Response.Write("<script>alert('Vui Lòng đăng nhập')</script>");
            }
            else
            {
                Label lbMau = null;
                Label lbTenSP = null;
                grnew.SelectedIndex = e.Item.ItemIndex;
                lbMau = grnew.SelectedItem.FindControl("lbMau") as Label;
                lbTenSP = grnew.SelectedItem.FindControl("lbTenSp") as Label;
                Label lbMaSp = grnew.SelectedItem.FindControl("lbMaSp") as Label;
                lbT.Text = lbTenSP.Text;
                lbM.Text = lbMau.Text;
                LoadSize(int.Parse(lbMaSp.Text), lbMau.Text);
                cbSize.SelectedIndex = 0;
                lbMaGiay.Text = lbMaSp.Text;
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "ShowPopup();", true);
            }
        }

        protected void grBest_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (Session["cart"] == null)
            {
                Response.Write("<script>alert('Vui Lòng đăng nhập')</script>");
            }
            else
            {
                Label lbMau = null;
                Label lbTenSP = null;
                grBest.SelectedIndex = e.Item.ItemIndex;
                lbMau = grBest.SelectedItem.FindControl("lbMau") as Label;
                lbTenSP = grBest.SelectedItem.FindControl("lbTenSp") as Label;
                Label lbMaSp = grBest.SelectedItem.FindControl("lbMaSp") as Label;
                lbT.Text = lbTenSP.Text;
                lbM.Text = lbMau.Text;
                LoadSize(int.Parse(lbMaSp.Text), lbMau.Text);
                cbSize.SelectedIndex = 0;
                lbMaGiay.Text = lbMaSp.Text;
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "ShowPopup();", true);
            }
        }
    }
}