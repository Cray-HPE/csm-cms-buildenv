#
# MIT License
#
# (C) Copyright 2022 Hewlett Packard Enterprise Development LP
#
# Permission is hereby granted, free of charge, to any person obtaining a
# copy of this software and associated documentation files (the "Software"),
# to deal in the Software without restriction, including without limitation
# the rights to use, copy, modify, merge, publish, distribute, sublicense,
# and/or sell copies of the Software, and to permit persons to whom the
# Software is furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included
# in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
# THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
# OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
# ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
# OTHER DEALINGS IN THE SOFTWARE.

ARG UPSTREAM_IMAGE_HOST=docker.io
ARG IMAGE_NAME=opensuse/leap
ARG IMAGE_TAG=15.2
ARG BASE_IMAGE=${UPSTREAM_IMAGE_HOST}/${IMAGE_NAME}:${IMAGE_TAG}

FROM $BASE_IMAGE as base_image
RUN zypper --non-interactive update && \
    zypper --non-interactive install python3 python3-pip

COPY pip.conf /etc/pip.conf
RUN --mount=type=secret,id=netrc,target=/root/.netrc \
    pip3 install --no-cache-dir setuptools
