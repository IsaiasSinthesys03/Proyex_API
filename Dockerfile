# Usa la imagen oficial del SDK de .NET como entorno de compilación
FROM mcr.microsoft.com/dotnet/sdk:9.0 AS build-env
WORKDIR /App

# Copia todo el código
COPY . ./

# Restaura las dependencias y compila
RUN dotnet restore
RUN dotnet publish -c Release -o out

# Usa la imagen oficial de ASP.NET en tiempo de ejecución
FROM mcr.microsoft.com/dotnet/aspnet:9.0
WORKDIR /App
COPY --from=build-env /App/out .

# Configura variables de entorno para Kestrel
ENV ASPNETCORE_URLS=http://+:8080

# Exponer el puerto
EXPOSE 8080

# Iniciar la API
ENTRYPOINT ["dotnet", "Kiosco.API.dll"]
