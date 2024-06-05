From ubuntu:22.04 

#Variable de sistema nombre del usuario 
ENV USER=angel 
ENV PASSWORD=pepito33
ENV DEBIAN_FRONTEND=noninteractive

#POSTGRESQL
RUN apt update && apt install -y postgresql postgresql-client
 


# cambiar permisos a postgresql para que puedan acceder a el 
RUN echo "host all all 0.0.0.0/0 md5" >> /etc/postgresql/14/main/pg_hba.conf \
  && echo "listen_addresses='*'" >> /etc/postgresql/14/main/postgresql.conf

#cambiamos al usuario pstgress
USER postgres 


#Arrancamos el servicio y creamos el usuario
RUN service postgresql start && sleep 10 && psql -c "CREATE USER "${USER}" WITH PASSWORD '"${PASSWORD}"'"\
&& createdb ${USER} 

#PORT
EXPOSE 5432

#REINICIAMOS Y LO DEJAMOS ACTIVO
CMD service postgresql restart && tail -f /dev/null









