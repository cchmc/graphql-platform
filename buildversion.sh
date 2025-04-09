#!/bin/zsh
dotnet build -p:Version=15.1.4-cchmc-1.7 -c Debug
dotnet pack -p:Version=15.1.4-cchmc-1.7 -c Debug
dotnet nuget push --source "CCHMC.Common" --api-key whatev HotChocolate/AspNetCore/src/Transport.Http/bin/Debug/HotChocolate.Transport.Http.15.1.4-cchmc-1.7.nupkg
dotnet nuget push --source "CCHMC.Common" --api-key whatev HotChocolate/AspNetCore/src/Transport.Abstractions/bin/Debug/HotChocolate.Transport.Abstractions.15.1.4-cchmc-1.7.nupkg
dotnet nuget push --source "CCHMC.Common" --api-key whatev HotChocolate/Utilities/src/Utilities/bin/Debug/HotChocolate.Utilities.15.1.4-cchmc-1.7.nupkg
dotnet nuget push --source "CCHMC.Common" --api-key whatev HotChocolate/Language/src/Language.SyntaxTree/bin/Debug/HotChocolate.Language.SyntaxTree.15.1.4-cchmc-1.7.nupkg
dotnet nuget push --source "CCHMC.Common" --api-key whatev StrawberryShake/Client/src/Core/bin/Debug/StrawberryShake.Core.15.1.4-cchmc-1.7.nupkg
dotnet nuget push --source "CCHMC.Common" --api-key whatev StrawberryShake/Client/src/Transport.Http/bin/Debug/StrawberryShake.Transport.Http.15.1.4-cchmc-1.7.nupkg
dotnet nuget push --source "CCHMC.Common" --api-key whatev StrawberryShake/Client/src/Transport.WebSockets/bin/Debug/StrawberryShake.Transport.WebSockets.15.1.4-cchmc-1.7.nupkg
dotnet nuget push --source "CCHMC.Common" --api-key whatev StrawberryShake/Client/src/Razor/bin/Debug/StrawberryShake.Razor.15.1.4-cchmc-1.7.nupkg
dotnet nuget push --source "CCHMC.Common" --api-key whatev StrawberryShake/MetaPackages/Blazor/bin/Debug/StrawberryShake.Blazor.15.1.4-cchmc-1.7.nupkg
dotnet nuget push --source "CCHMC.Common" --api-key whatev StrawberryShake/Tooling/src/dotnet-graphql/nupkg/StrawberryShake.Tools.15.1.4-cchmc-1.7.nupkg
dotnet nuget push --source "CCHMC.Common" --api-key whatev StrawberryShake/Client/src/Resources/bin/Debug/StrawberryShake.Resources.15.1.4-cchmc-1.7.nupkg