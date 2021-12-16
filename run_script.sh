#!/bin/bash
docker run -d \
		--cap-add sys_ptrace \
		-p127.0.0.1:2222:22 \
		-v ~/remote_dev:/home/dealii/ \
		--name dealii_devtools \
		--restart unless-stopped\
		juliandoerner/dealii_toolchain:0.1 
