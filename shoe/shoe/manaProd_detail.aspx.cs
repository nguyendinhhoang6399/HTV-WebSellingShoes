using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace shoe
{
    public partial class manaProd_detail : System.Web.UI.Page
    {
        static string masp = "";   
        protected void Page_Load(object sender, EventArgs e)
        {
            
           
                if (Session["MaSp"] == null)
                {
                    Response.Redirect("manageProduct.aspx");
                }
                else
                {
                if (!IsPostBack)
                {
                    masp = Session["MaSp"] as string;
                    LoadGrCTSP();
                    LoadDropSize();
                }
                   
             }
            
            
        }
        void LoadGrCTSP()
        {
            string sql = "select CT.masp, CT.mausac, S.name, CT.giaban, CT.SoLuongTon, CT.anh from CTSP CT, Size S where CT.masize = S.SizeId and CT.masp = '"+masp+"'";
            DataTable data = KetNoi.Excutequerry(sql);
            GrvCTSP.DataSource = data;
            GrvCTSP.DataBind();
        }
        void LoadDropSize()
        {
            string sql = "select * from Size";
            DataTable data = KetNoi.Excutequerry(sql);
            DropSize.DataSource = data;
            DropSize.DataTextField = "name";
            DropSize.DataValueField = "SizeId";
            DataBind();
        }
        bool CheckFileType(string fileName)
        {

            string ext = Path.GetExtension(fileName);
            switch (ext.ToLower())
            {
                case ".gif":
                    return true;
                case ".png":
                    return true;
                case ".jpg":
                    return true;
                case ".jpeg":
                    return true;
                default:
                    return false;
            }
        }
        protected void btnThem_Click(object sender, EventArgs e)
        {
            string url = "";
            if (Page.IsValid && UploadImg.HasFile && CheckFileType(UploadImg.FileName))
            {
                string fileName = "images/" + UploadImg.FileName;
                string filePath = MapPath(fileName);
                UploadImg.SaveAs(filePath);
                Image1.ImageUrl = fileName;
                url = fileName;
            }
            if (txMauSac.Text == String.Empty && txSoLuong.Text == String.Empty && txGiaBan.Text == String.Empty)
            {
                Response.Write("<script>alert('Hãy nhập đủ dữ liệu!!')</script>");
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "ShowAdd();", true);
            }
            else
            {
                String sql = "Insert into CTSP(mausac,masize,giaban,soluongton,anh) values(N'" + txMauSac.Text + "',N'" + DropSize.SelectedValue + "',N'" + txGiaBan.Text + "',N'" + txSoLuong.Text + "',N'" + url + "')";
                Response.Write("<script>alert('Thêm thành công!!')</script>");
                DataTable data = KetNoi.Excutequerry(sql);
                LoadGrCTSP();
            }
        }
        string getsizeid(string name)
        {
            string sql = "Select sizeId from size where name='" + name + "'";
            DataTable data = KetNoi.Excutequerry(sql);
            foreach (DataRow row in data.Rows)
                return row["sizeId"].ToString();
            return "";
        }
        protected void lbThemSp_Click(object sender, EventArgs e)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "alert", "ShowAdd();", true);
        }

        protected void GrvCTSP_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GrvCTSP.PageIndex = e.NewPageIndex;
            LoadGrCTSP();
        }

        protected void GrvCTSP_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GrvCTSP.EditIndex = -1;
            LoadGrCTSP();
        }

        protected void GrvCTSP_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GrvCTSP.EditIndex = e.NewEditIndex;
            LoadGrCTSP();
        }

        protected void GrvCTSP_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = GrvCTSP.Rows[e.RowIndex];
            string MaSp = GrvCTSP.DataKeys[e.RowIndex].Value.ToString();
            Label mausac = (Label)row.FindControl("lbMauSac");
            Label size = (Label)row.FindControl("lbSize");
            TextBox gia = (TextBox)row.FindControl("txtGiaBan");
            TextBox sl = (TextBox)row.FindControl("txSoLuongUp");
            //FileUpload file = 

        }

        protected void GrvCTSP_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            GridViewRow row = GrvCTSP.Rows[e.RowIndex];
            //int MaSp = int.Parse(GrvCTSP.DataKeys[e.RowIndex].Value.ToString());
            Label mausac = (Label)row.FindControl("Label2");
            Label size = (Label)row.FindControl("Label3");
            string maSize = getsizeid(size.Text);
            string sql = "delete CTSP where masp = '" + masp + "' and mausac = N'" + mausac.Text + "' and masize = '" + maSize + "'";
           
            KetNoi.Excutequerry(sql);
            Response.Write("<script>alert('Xóa thành công!!')</script>");
            LoadGrCTSP();
        }

        protected void GrvCTSP_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}