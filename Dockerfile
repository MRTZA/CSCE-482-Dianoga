FROM continuumio/miniconda

# Create the environment:
RUN apt-get update && \
    conda create -y --name capstone python=3.6

# Make RUN commands use the new environment:
SHELL ["conda", "run", "-n", "capstone", "/bin/bash", "-c"]

# Install libraries to environment:
RUN conda install -y -c conda-forge keras=2.2.4 opencv=4.2 && \
    conda install -y -c anaconda tensorflow-gpu=1.4 cudnn=6.0.21 cudatoolkit=8.0 && \
    conda install -y -c powerai imageai=2.1.5

