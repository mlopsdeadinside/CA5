# Use the official SQL Server 2019 image from Microsoft
FROM mcr.microsoft.com/mssql/server:2019-latest

# Set the SA password for SQL Server (change this to a strong password)
ENV SA_PASSWORD=CAT@DOG123
