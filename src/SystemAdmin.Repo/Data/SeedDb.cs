using Microsoft.AspNetCore.Identity;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Diagnostics.CodeAnalysis;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SystemAdmin.Common.Models;

namespace SystemAdmin.Repo.Data
{
    [ExcludeFromCodeCoverage]
    public class SeedDb
    {
        private readonly Context _context;
        private readonly UserManager<User> _userManager;
        
        public SeedDb(
            Context context,
            UserManager<User> userManager)
        {
            _context = context;
            _userManager = userManager;
        }
        public async Task SeedDbAsync()
        {
            await CheckUserAsync();
        }

        private async Task CheckUserAsync()
        {
            if (!_context.Users.Any())
            {
                var user = new User()
                {
                    UserName = "admin",
                    Email = "admin@yopmail.com",
                    FullName = "SYSADMIN"
                };

                await _userManager.CreateAsync(user, "admin");
                await _context.SaveChangesAsync();
            }
        }
    }
}
