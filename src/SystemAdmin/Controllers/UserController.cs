using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using Microsoft.Extensions.Options;
using Microsoft.IdentityModel.Tokens;
using System;
using System.IdentityModel.Tokens.Jwt;
using System.Net;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;
using SystemAdmin.Common.Models;
using SystemAdmin.Common.Settings;
using SystemAdmin.Models;

namespace SystemAdmin.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class UserController : ControllerBase
    {
        private readonly ILogger<UserController> _logger;
        private readonly UserManager<User> _userManager;
        private readonly SignInManager<User> _signInManager;
        private readonly JwtSetting _settingsJwt;

        public UserController(
            ILogger<UserController> logger,
            UserManager<User> userManager,
            SignInManager<User> signInManager,
            IOptionsMonitor<JwtSetting> jwtSetting)
        {
            _logger = logger;
            _userManager = userManager;
            _signInManager = signInManager;
            _settingsJwt = jwtSetting.CurrentValue;
        }


        [HttpPost]
        [ProducesResponseType((int)HttpStatusCode.BadRequest)]
        [ProducesResponseType((int)HttpStatusCode.OK, Type = typeof(Object))]
        [Route("Register")]
        public async Task<Object> PostUser(UserModel model)
        {
            _logger.LogInformation(nameof(PostUser));
            try
            {
                var user = new User()
                {
                    UserName = model.UserName,
                    Email = model.Email,
                    FullName = model.FullName
                };

                var result = await _userManager.CreateAsync(user, model.Password);
                return Ok(result);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex,$"{nameof(PostUser)} fallo general");
                throw;
            }
        }

        [HttpPost]
        [ProducesResponseType((int)HttpStatusCode.BadRequest)]
        [ProducesResponseType((int)HttpStatusCode.OK, Type = typeof(IActionResult))]
        [Route("Login")]
        public async Task<IActionResult> Login(UserModel model)
        {
            _logger.LogInformation(nameof(Login));
            try
            {
                var user = await _userManager.FindByNameAsync(model.UserName);
                if (user != null && await _userManager.CheckPasswordAsync(user, model.Password))
                {
                    var key = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_settingsJwt.SecretKey));
                    //var tokenDescriptor = new SecurityTokenDescriptor
                    //{
                    //    Subject = new ClaimsIdentity(new Claim[]
                    //    {
                    //        new Claim(ClaimTypes.Name, user.UserName),
                    //        new Claim(ClaimTypes.Email, user.Email),
                    //        new Claim("UserId", user.Id.ToString()),
                    //        new Claim("FullName", user.FullName),
                    //    }),
                    //    Expires = DateTime.UtcNow.AddHours(1),
                    //    SigningCredentials = new SigningCredentials(key, SecurityAlgorithms.HmacSha256)
                    //};
                    //var tokenHandler = new JwtSecurityTokenHandler();

                    //var securityToken = tokenHandler.CreateToken(tokenDescriptor);
                    //var token = tokenHandler.WriteToken(securityToken);

                    //Header 
                    var credential = new SigningCredentials(key, SecurityAlgorithms.HmacSha256);
                    var header = new JwtHeader(credential);

                    //Claims 
                    var claims = new[]
                    {
                        new Claim(ClaimTypes.Name, user.UserName),
                        new Claim(ClaimTypes.Email, user.Email),
                        new Claim("UserId", user.Id.ToString()),
                        new Claim("FullName", user.FullName),
                    };

                    //Payload
                    var payload = new JwtPayload(
                            _settingsJwt.Issuer,
                            _settingsJwt.Audience,
                            claims,
                            DateTime.Now,
                            DateTime.UtcNow.AddHours(1)
                        );

                    var tokenSecurity = new JwtSecurityToken(header, payload);
                    var token = new JwtSecurityTokenHandler().WriteToken(tokenSecurity);
                    return Ok(new { token });
                }
                else
                    return BadRequest(new { message = "User or Password is incorrect " });
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, $"{nameof(Login)} fallo general");
                throw;
            }
            
        }

    }
}
