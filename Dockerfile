# Sobre cual distribución vamos a trabajar
FROM    centos:centos6

# Dependencias para NodeJS
RUN     rpm -Uvh http://download.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm

# Instalar Node.js and npm
RUN     yum install -y npm

# Instalando nodemon
RUN     npm -g install nodemon

# Copiando el contenido del repo hacia la carpeta "src"
COPY    . /src

# Instalando dependencias
RUN     cd /src; npm install

# Haciendo público el puerto 3000
EXPOSE  3000

# Iniciando el servidor
CMD     ["nodemon", "/src/bin/www"]

#docker build -t leopic/componentes-node-servidor /Users/leo/Sites/rest/
#docker run --name servidor -p 4000:3000 -d -v /Users/leo/Sites/rest:/src leopic/componentes-node-servidor
#docker logs -tf servidor
