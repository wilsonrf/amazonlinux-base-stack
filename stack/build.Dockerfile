FROM public.ecr.aws/amazonlinux/amazonlinux:2023

ARG packages

RUN dnf -y update && \
    dnf -y upgrade && \
    dnf -y install $packages