#!/bin/zsh
version="15.1.4-cchmc-1.9"
dotnet build -p:Version=$version -c Debug
# dotnet pack -p:Version=$version -c Debug
# dotnet nuget push --source "CCHMC.Common" --api-key whatev HotChocolate/AspNetCore/src/Transport.Http/bin/Debug/HotChocolate.Transport.Http.$version.nupkg
# dotnet nuget push --source "CCHMC.Common" --api-key whatev HotChocolate/AspNetCore/src/Transport.Abstractions/bin/Debug/HotChocolate.Transport.Abstractions.$version.nupkg
# dotnet nuget push --source "CCHMC.Common" --api-key whatev HotChocolate/Utilities/src/Utilities/bin/Debug/HotChocolate.Utilities.$version.nupkg
# dotnet nuget push --source "CCHMC.Common" --api-key whatev HotChocolate/Language/src/Language.SyntaxTree/bin/Debug/HotChocolate.Language.SyntaxTree.$version.nupkg
# dotnet nuget push --source "CCHMC.Common" --api-key whatev StrawberryShake/Client/src/Core/bin/Debug/StrawberryShake.Core.$version.nupkg
# dotnet nuget push --source "CCHMC.Common" --api-key whatev StrawberryShake/Client/src/Transport.Http/bin/Debug/StrawberryShake.Transport.Http.$version.nupkg
# dotnet nuget push --source "CCHMC.Common" --api-key whatev StrawberryShake/Client/src/Transport.WebSockets/bin/Debug/StrawberryShake.Transport.WebSockets.$version.nupkg
# dotnet nuget push --source "CCHMC.Common" --api-key whatev StrawberryShake/Client/src/Razor/bin/Debug/StrawberryShake.Razor.$version.nupkg
# dotnet nuget push --source "CCHMC.Common" --api-key whatev StrawberryShake/MetaPackages/Blazor/bin/Debug/StrawberryShake.Blazor.$version.nupkg
# dotnet nuget push --source "CCHMC.Common" --api-key whatev StrawberryShake/Tooling/src/dotnet-graphql/nupkg/StrawberryShake.Tools.$version.nupkg
# dotnet nuget push --source "CCHMC.Common" --api-key whatev StrawberryShake/Client/src/Resources/bin/Debug/StrawberryShake.Resources.$version.nupkg