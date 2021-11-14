using AutoMapper;
using System;
using SystemAdmin.Common.Models;
using SystemAdmin.Common.Models.DTOs;

namespace SystemAdmin.Helpers
{
    public class AutoMapping : Profile
    {
        public AutoMapping()
        {
            CreateMap<Employee, EmployeeDto>()
                .ForMember(dest => dest.Id, orig => orig.MapFrom(src => src.Id));
            CreateMap<EmployeeDto, Employee>()
                .ForMember(dest => dest.Id, orig => orig.MapFrom<Guid>(src => Guid.Parse(src.Id)));
        }
    }
}
