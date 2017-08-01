using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(KTV_MS.Startup))]
namespace KTV_MS
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
