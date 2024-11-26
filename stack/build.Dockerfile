FROM public.ecr.aws/amazonlinux/amazonlinux:2023

LABEL io.buildpacks.stack.id="com.wilsonfranca.stacks.amazonlinux.al2023"
LABEL io.buildpacks.base.distro.name="amazonlinux"
LABEL io.buildpacks.base.distro.version="2023"

ARG packages
ARG cnb_gid=1000
ARG cnb_uid=1001

RUN dnf -y update && \
    dnf -y upgrade && \
    dnf -y install $packages
    
RUN groupadd cnb --gid ${cnb_gid}
RUN useradd --uid ${cnb_uid} --gid ${cnb_gid} -m -s /bin/bash cnb

USER ${cnb_uid}:${cnb_gid}

ENV CNB_USER_ID=${cnb_uid}
ENV CNB_GROUP_ID=${cnb_gid}
ENV CNB_STACK_ID="com.wilsonfranca.stacks.amazonlinux.al2023"