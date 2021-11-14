using Microsoft.AspNetCore.Identity;

namespace SystemAdmin.Common.Models
{
    public class User : IdentityUser
    {
        public string FullName { get; set; }
    }
}
