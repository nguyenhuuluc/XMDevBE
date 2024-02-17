namespace XMDevBE.Models
{
    public class ProductViewModels
    {
        public List<Product> data { get; set; }
        public int TotalCount { get; set; }
        public int PageSize { get; set; }
        public int PageNumber { get; set; }
        public int PageCount { get; set; }
    }
}
