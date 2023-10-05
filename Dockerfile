# Use the official SQL Server 2019 image from Microsoft
FROM mcr.microsoft.com/mssql/server:2019-latest

# Set the SA password for SQL Server (change this to a strong password)
ENV SA_PASSWORD=CAT@DOG123

# Copy the SQL script into the image
COPY create-db.sql /docker-entrypoint-initdb.d/

# Define the command to run when the container starts
CMD ["/opt/mssql/bin/sqlservr"]