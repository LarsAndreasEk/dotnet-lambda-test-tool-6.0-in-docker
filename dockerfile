FROM mcr.microsoft.com/dotnet/sdk:6.0

RUN dotnet tool install --global amazon.lambda.testtool-6.0 --version 0.12.6

ENV PATH="/root/.dotnet/tools:${PATH}"

COPY lambda /lambda
WORKDIR /lambda
RUN dotnet build

WORKDIR /lambda/bin/Debug/net6.0
ENTRYPOINT ["dotnet-lambda-test-tool-6.0", "--no-launch-window", "--host", "*"]