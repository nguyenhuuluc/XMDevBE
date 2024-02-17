using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace XMDevBE.Entities
{
    [Table("ACCOUNT")]
    public class UserEntity
    {
        [Key]
        public int Id { get; set; }
        public string TenDN { get; set; }
        public string MatKhau { get; set; }
        public string HoTen { get; set; }
        public string PhanQuyen { get; set; }
    }
}
