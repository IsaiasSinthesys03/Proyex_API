# Proyex API (El Motor Backend) ⚙️
![Project Version](https://img.shields.io/badge/version-1.0.0-blue)
![C#](https://img.shields.io/badge/C%23-.NET%209-239120?logo=c-sharp)
![MongoDB](https://img.shields.io/badge/MongoDB-Atlas-47A248?logo=mongodb)

## 📖 Descripción Breve
Proyex API es el músculo asíncrono, persistente y en tiempo real del ecosistema tecnológico. Provee el anclaje seguro, las reglas de validación subyacentes y los flujos de "Real-Time" requeridos de manera paralela para aguantar la carga del panel administrativo "PX Forge" y transacciones dinámicas de la App Móvil simultáneamente durante eventos corporativos o académicos.

## ✨ Características Principales
- **Sistema WebSockets Interactivo:** Manejo del algoritmo del Top Rankings en vivo. Las pantallas evalúan un recálculo asíncrono y se reflejan instántaneamente hacia los páneles via SignalR.
- **Ingesta de Media Escalada:** Arquitectura de recepción (Kestrel) configurada agresivamente para soportar adjuntos gigantescos locales de hasta 500 MB (Ej. demoreels de exhibición).
- **Control Férreo y Autenticación:** Verificación criptográfica con flujos completos basados en inyección de JWT (JSON Web Tokens).
- **Trazabilidad Lógica (Soft-Delete):** Persiste plantillas de evaluación previas permitiendo "snapshots" versionado de los criterios y baja temporal lógica en lugar de borrado físico destructivo.

## 🏗️ Arquitectura y Stack Tecnológico
- **Backend Core:** Desarrollado bajo C# moderno compilando en .NET CLR (.NET 9+).
- **Base de Datos Ágil:** MongoDB NoSQL, explotado tácticamente para guardar esquemas fuertemente anidados (imágenes vinculadas, historial de valoraciones) limitando la fragmentación sobre operaciones intensivas de lectura.
- **Patrones de Diseño Exclusivos:** 
  - **Clean Architecture rígida:** El cerebro de .NET se dividió quirúrgicamente separando la persistencia de la presentación (Capas: `Domain`, `Application`, `Infrastructure`, `API`). 
  - Cumplimiento de los principios **SOLID**, basándose activamente en una red central de *Inversión e Inyección de Dependencias (DI)* en cada sub-servicio o Middleware.
  - Modelo de Eventos Publicador-Suscriptor embebido a la web moderna (**SignalR**).

## ⚙️ Prerrequisitos e Instalación
1. **.NET SDK** versión 9.0 o equivalente listado en tu consola local.
2. Servidor corriendo MongoDB (`mongodb://localhost:27017`) o la credencial apuntando a un clúster MongoDB Atlas.
3. Clonar y bajar el andamio backend desde Git:
   ```bash
   git clone https://github.com/IsaiasSinthesys03/Proyex_API.git
   ```
4. Posicionarse en el Entry Point del servidor web y restaurar dependencias NuGet (implícito con run):
   ```bash
   cd Kiosco.API
   ```
5. Sustituir/Afinar llaves en el sistema de secretos internos (`appsettings.json` o `.Development`) indicando el emisor del JWT y las cadenas de host DB segura.
6. Encender Pipeline Local: 
   ```bash
   dotnet run
   ```

## 📂 Estructura de Carpetas
```text
Proyex_API/
 ├── Kiosco.Domain/          # [CORE] Capa de Entidades Base, reglas abstractas puras, enums y Contratos Repository.
 ├── Kiosco.Application/     # [BUSINESS] Lógica pre-empaquetada y orquestadora (Services e interacciones transaccionales).
 ├── Kiosco.Infrastructure/  # [SUPPORT] Conexiones reales (Motor DB de Mongo, Ingesta FileSystem de medios).
 ├── Kiosco.API/             # [ENTRY] La coraza Web RESTful. Presenta la información y gestiona autenticaciones de rutas.
 │   ├── Controllers/        # Controladores que exponen endpoints HTTP.
 │   ├── Hubs/               # Rutas e inyectores de Sockets bidireccionales.
 │   ├── appsettings.json    # Parámetros variables del despliegue en memoria.
 │   └── Program.cs          # Archivo unificador del Bootstrapping y las Inyecciones de Dependencia primarias.
 └── Kiosco.sln              # Índice de la solución de Micro-Ecosistema C# Studio.
```

## 👥 El Equipo
El desafío de acoplar y asegurar una API escalable de grado empresarial demandó destreza e iteración acelerada. Todo el pipeline seguro de Middlewares, Modelado de Dominio e integración en Real-Time fue elogiable gracias a la ascesis técnica provista por:

- **Braulio Isaias Bernal Padron**
- **Yeng Lee Salas Jimenez**
- **Erick Leonardo Lopez Hernandez**
- **Jonathan Aaron Perez Mendez**

### 🤖 IA-Augmented Development (+IA)
Pero el "músculo" invencible de nuestro servidor tiene un as bajo la manga. **El backend entero fue propulsado y forjado aplicando tácticas y arquitecturas dictadas bajo IA-Augmented Engineering (+IA).** Discutiendo directamente algoritmos de Clean Architecture en sesiones hiper-enfocadas con entidades generativas, blindamos el cifrado y evitamos semanas de investigación estancada. La fusión de audacia cognitiva humana con la omnipresencia lógica en frío lograda con Machine Learning nos consolidó una solidez titánica: un API que literalmente **desborda pura eficiencia y seguridad al primer clic**. 

---
*(Información y guías de despliegue originales persistidas a continuación)*

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
