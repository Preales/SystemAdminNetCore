using AutoMapper;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Net;
using System.Threading.Tasks;
using SystemAdmin.Common.Helpers;
using SystemAdmin.Common.Models;
using SystemAdmin.Common.Models.DTOs;
using SystemAdmin.Services.Interfaces;

namespace SystemAdmin.Controllers
{
    [Authorize]
    [ApiController]
    [Route("api/[controller]")]
    public class EmployeeController : ControllerBase
    {
        private readonly ILogger<EmployeeController> _logger;
        private readonly IEmployeeService _service;
        private readonly IMapper _mapper;

        public EmployeeController(
            ILogger<EmployeeController> logger,
            IEmployeeService service,
            IMapper mapper)
        {
            _logger = logger;
            _service = service;
            _mapper = mapper;
        }

        [HttpGet]
        [ProducesResponseType((int)HttpStatusCode.BadRequest)]
        [ProducesResponseType((int)HttpStatusCode.OK, Type = typeof(IEnumerable<Employee>))]
        [Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        public async Task<IActionResult> GetAllAsync()
        {
            _logger.LogInformation(nameof(GetAllAsync));
            try
            {
                var result = await _service.GetAllAsync();
                return Ok(new ApiResponse<IEnumerable<Employee>>("OK", "", result));
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, $"{nameof(GetAllAsync)} fallo general");
                return Ok(new ApiResponse<Exception>("ERROR", ex.Message, ex));
            }
        }

        [HttpGet]
        [ProducesResponseType((int)HttpStatusCode.BadRequest)]
        [ProducesResponseType((int)HttpStatusCode.OK, Type = typeof(Employee))]
        [Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        [Route("{Id}")]
        public async Task<IActionResult> GetByIdAsync(string Id)
        {
            _logger.LogInformation(nameof(GetByIdAsync));
            try
            {
                var result = await _service.GetByIdAsync(Guid.Parse(Id));
                return Ok(new ApiResponse<Employee>("OK", "", result));
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, $"{nameof(GetByIdAsync)} fallo general");
                return Ok(new ApiResponse<Exception>("ERROR", ex.Message, ex));
            }
        }

        [HttpPost]
        [ProducesResponseType((int)HttpStatusCode.BadRequest)]
        [ProducesResponseType((int)HttpStatusCode.OK, Type = typeof(EmployeeDto))]
        [Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        public async Task<IActionResult> PostAsync(EmployeeDto data)
        {
            _logger.LogInformation(nameof(PostAsync));
            try
            {
                data.Id = Guid.NewGuid().ToString();
                var entity = _mapper.Map<Employee>(data);
                await _service.AddAsync(entity);
                return Ok(new ApiResponse<Employee>("OK", "",entity));
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, $"{nameof(PostAsync)} fallo general");
                return Ok(new ApiResponse<Exception>("ERROR", ex.Message, ex));
            }
        }

        [HttpPut]
        [ProducesResponseType((int)HttpStatusCode.BadRequest)]
        [ProducesResponseType((int)HttpStatusCode.OK, Type = typeof(Employee))]
        [Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        public async Task<IActionResult> PutAsync(Employee entity)
        {
            _logger.LogInformation(nameof(PutAsync));
            try
            {
                await _service.UpdateAsync(entity);
                return Ok(new ApiResponse<Employee>("OK", "", entity));
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, $"{nameof(PutAsync)} fallo general");
                return Ok(new ApiResponse<Exception>("ERROR", ex.Message, ex));
            }
        }
    }
}
