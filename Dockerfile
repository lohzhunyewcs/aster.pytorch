FROM nvidia/cuda:9.0-cudnn7-devel-ubuntu16.04
# RUN apt-get update && apt-get upgrade
RUN curl -O https://repo.anaconda.com/archive/Anaconda3-5.2.0-Linux-x86_64.sh
RUN bash Anaconda3-5.2.0-Linux-x86_64.sh
RUN source ~/.bashrc && conda install environment.yml
ENV FORCE_CUDA="1"
CMD source activate recognition && sh scripts/stn_att_rec.sh