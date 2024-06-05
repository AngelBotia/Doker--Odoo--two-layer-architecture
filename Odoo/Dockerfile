From ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update
#GIT
RUN apt install -y git
#ODOO repositorio
RUN  git clone https://github.com/odoo/odoo.git




#PYTHON & PIP 
RUN apt install -y python3 python3-pip libldap2-dev libpq-dev libsasl2-dev 


#POSTGRESQL
RUN apt install postgresql -y



#REQUIREMENTS
RUN  cd /odoo && pip install -r requirements.txt


#Configurar odoo.conf para que cojas la variables del sistema
#RUN echo "[options]" > /odoo/debian/odoo.conf \
#   && echo "admin_passwd=$ADMIN_PASS" >> /odoo/debian/odoo.conf \
#    && echo "db_host=$DB_HOST" >> /odoo/debian/odoo.conf \
#    && echo "db_port=$DB_PORT" >> /odoo/debian/odoo.conf \
#    && echo "db_user=$DB_USER" >> /odoo/debian/odoo.conf \
#    && echo "db_password=$DB_PASSWORD" >> /odoo/debian/odoo.conf \
#    && echo "db_name=$DB" >> /odoo/debian/odoo.conf \
#    && echo "dbfilter = ^mycompany.*$" >> /odoo/debian/odoo.conf
#Lo hago asi y no copiando los archivos por que de la otra manera me daba problemas

#PORT
EXPOSE 8069

USER postgres

#EJECUTAMOS pasandole todas la variables tenbgo que pasarselas asi por que editando el .conf no las coge
CMD cd /odoo && python3 odoo-bin -d $DB --db_host=$DB_HOST --db_port=$DB_PORT --db_user=$DB_USER --db_password=$DB_PASSWORD -i base


#--addons-path=addons -d $db
