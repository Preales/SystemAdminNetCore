using System;
using SystemAdmin.Common.Base;

namespace SystemAdmin.Common.Models
{
    public class Employee : ModelBase
    {
        public Guid Id { get; set; } = Guid.NewGuid();
        public string Name { get; set; }
        public string LastName { get; set; }
        public string Identification { get; set; }
        public string Charge { get; set; }
    }
}
