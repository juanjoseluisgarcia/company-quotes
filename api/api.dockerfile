FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src

COPY . .

RUN dotnet restore "api.sln"
RUN dotnet build "api/api.csproj" -c Release -o /app/build
RUN dotnet publish "api/api.csproj" -c Release -o /app/publish


FROM mcr.microsoft.com/dotnet/aspnet:8.0

RUN apt-get update && apt-get install -y iputils-ping dnsutils curl
WORKDIR /app
COPY --from=build /app/publish .
ENV ASPNETCORE_ENVIRONMENT Docker
ENTRYPOINT ["dotnet", "api.dll"]