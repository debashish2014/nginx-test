FROM node:14.17.5 AS Build
WORKDIR /usr/src/app 
COPY . .

FROM nginx AS Final
RUN apt-get update
RUN apt-get install -y nginx-extras
# COPY --from=Build /usr/src/app/default.conf /etc/nginx/nginx.conf
COPY --from=Build /usr/src/app/nginx-default-conf.conf /etc/nginx/nginx.conf
COPY --from=Build /usr/src/app/build /usr/share/nginx/html


