FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /src
COPY dotnet-api-example.csproj .
RUN dotnet restore
COPY . .
RUN dotnet publish -c release -o /app

FROM mcr.microsoft.com/dotnet/aspnet:6.0
WORKDIR /app
EXPOSE 80
COPY --from=build /app .
ENTRYPOINT ["dotnet", "dotnet-api-example.dll"]
