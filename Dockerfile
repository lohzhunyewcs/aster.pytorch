FROM nvidia/cuda:9.0-cudnn7-devel-ubuntu16.04
# # RUN apt-get update && apt-get upgrade
# RUN curl -O https://repo.anaconda.com/archive/Anaconda3-5.2.0-Linux-x86_64.sh
# RUN bash Anaconda3-5.2.0-Linux-x86_64.sh
# RUN source ~/.bashrc && conda install environment.yml
# CMD source activate recognition && sh scripts/stn_att_rec.sh

RUN  apt-get update -y && \
     apt-get upgrade -y && \
     apt-get dist-upgrade -y && \
     apt-get -y autoremove && \
     apt-get clean
RUN apt-get install -y zip 

FROM continuumio/miniconda
ENV FORCE_CUDA="1"
ENV PYTHONBUFFERED="0"
WORKDIR /usr/src/app
COPY ./ ./
RUN conda env create -f environment.yml

# CMD ["bash"]

# Make RUN commands use the new environment:
SHELL ["conda", "run", "-n", "recognition", "/bin/bash", "-c"]

# EXPOSE 5003
# The code to run when container is started:
ENTRYPOINT ["conda", "run", "-n", "recognition", "sh", "scripts/stn_att_rec.sh"]