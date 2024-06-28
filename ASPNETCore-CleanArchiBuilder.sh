#!/bin/bash

mkdir $1 && cd $1

dotnet new .gitignore

mkdir src && cd src

dotnet new sln --name $1

dotnet new web --output $1.Presentation --use-program-main

dotnet new classlib --output $1.Infrastructure
dotnet new classlib --output $1.Application
dotnet new classlib --output $1.Domain

dotnet sln add $1.Presentation
dotnet sln add $1.Infrastructure
dotnet sln add $1.Application
dotnet sln add $1.Domain

dotnet add $1.Application reference $1.Domain
dotnet add $1.Infrastructure reference $1.Application
dotnet add $1.Presentation reference $1.Infrastructure

dotnet build
