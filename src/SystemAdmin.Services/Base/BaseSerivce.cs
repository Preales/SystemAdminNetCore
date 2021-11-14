using SystemAdmin.Repo;

namespace SystemAdmin.Services.Base
{
    public abstract class BaseService
    {
        protected Context _contexto;

        protected BaseService(Context context)
        {
            _contexto = context;
        }
    }
}
