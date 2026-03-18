# Despliegue en Render - Kiosco API

Para desplegar esta API en Render como un **Web Service**, configura las siguientes variables de entorno en el panel de control de Render (Dashboard > Environment):

## Variables de Entorno Requeridas

| Variable | Descripción | Ejemplo |
| :--- | :--- | :--- |
| `ASPNETCORE_ENVIRONMENT` | Ambiente de ejecución | `Production` |
| `ConnectionStrings__MongoDbConnection` | Cadena de conexión a MongoDB Atlas | `mongodb+srv://user:pass@cluster.mongodb.net/dbname` |
| `Jwt__Key` | Clave secreta para firmar tokens JWT (Mínimo 32 caracteres) | `TuClaveSuperSecretaDeMasDe32Caracteres` |
| `Jwt__Issuer` | Emisor del token | `kiosco_api` |
| `Jwt__Audience` | Audiencia del token | `kiosco_client` |
| `CORS_ALLOWED_ORIGINS` | URLs de tu Web App permitidas (Separadas por coma) | `https://tu-web-app.onrender.com` |

## Notas de Despliegue
- **Runtime:** Docker o Native (.NET 9.0+)
- **Build Command:** `dotnet publish -c Release -o out`
- **Start Command:** `dotnet out/Kiosco.API.dll` (O similar dependiendo de la estructura de salida)
- **Port:** No es necesario configurar el puerto manualmente en Render, el código detectará automáticamente la variable `PORT` asignada por Render.
