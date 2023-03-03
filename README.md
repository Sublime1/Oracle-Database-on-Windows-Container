# Oracle-Database-on-Windows-Container
Tested on ltsc2019 and ltsc2022 Windows Server Core images.

Download Oracle installation files and place it into build root folder:
https://www.oracle.com/database/technologies/oracle19c-windows-downloads.html

Download Visual C++ run-time package and also place it into build root folder:
https://www.microsoft.com/en-ie/download/details.aspx?id=40784

You may run into memory issues with building the Docker image. To see how much memory is available inside your container, run this:
systeminfo | findstr /C:"Total Physical Memory"

If you wish to increase the memory available create a %UserProfile%\.wslconfig file with these two lines:
[wsl2]
memory=8GB

Then shut down Docker Desktop and run this in command prompt (you may also need to reboot):
wsl --shutdown

# Build image:
docker build -m 8G -f Dockerfile -t oracle:ora193 . 

# Run docker image:

#interactive mode:

docker run -it --rm -m 8G -p 1521:1521 oracle:ora193

#detached mode

docker run -d -i -m 8G -p 1521:1521 oracle:ora193

#overwrite entrypoint

docker run -d -i -m 8G -p 1521:1521 oracle:ora193 powershell

# Connect to DB:
sqlplus sys/password@localhost:1521/ora193 as sysdba
