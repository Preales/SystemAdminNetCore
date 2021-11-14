using System;
using SystemAdmin.Common.Base;

namespace SystemAdmin.Common.Models.DTOs
{
    public class EmployeeDto
    {
        public string Id { get; set; }
        public string Name { get; set; }
        public string LastName { get; set; }
        public string Identification { get; set; }
        public string Charge { get; set; }
    }
}
