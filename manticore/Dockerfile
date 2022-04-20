FROM manticoresearch/manticore:4.2.0

RUN apt update && apt -y install sudo vim php-fpm php-mbstring

RUN mkhomedir_helper manticore
RUN usermod -aG sudo manticore
RUN echo "manticore ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

USER manticore
