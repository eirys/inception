FROM debian:buster

# Copy certificates and config file
# NB: the certificates can be generated during
# the RUN directive, with openssl. I decided to do it prior.
COPY ./srcs/certificate /nginx/certificate
COPY ./srcs/nginx.conf /etc/nginx/conf.d/default.conf

# Install nginx
RUN apt-get update -y \
&& apt-get install -y nginx \
&& apt-get clean

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
