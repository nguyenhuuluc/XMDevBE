namespace XMDevBE.Models
{
    public class Product
    {
        public int Id { get; set; }
        public string TenSP { get; set; }
        public int LoaiSP_Id { get; set; }
        public int ThuongHieu_Id { get; set; }
        public decimal GiaNhap { get; set; }
        public decimal GiaBan { get; set; }
        public int SoLuong { get; set; }
        public string HinhAnh { get; set; }
        public string MoTa { get; set; }
        public bool IsActive { get; set; }
        public bool IsDeleted { get; set; }
    }
}
