FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build-env
WORKDIR /SampleWebApiAspNetCore
COPY . ./
RUN dotnet publish -c Release -o out

FROM mcr.microsoft.com/dotnet/aspnet:6.0
WORKDIR /SampleWebApiAspNetCore
COPY --from=build-env /SampleWebApiAspNetCore/out .
EXPOSE 80
ENTRYPOINT ["dotnet", "SampleWebApiAspNetCore.dll"]