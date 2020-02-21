FROM continuumio/miniconda

# Create the environment:
RUN apt-get update && \
    conda create -y --name capstone python=3.6

# Make RUN commands use the new environment:
SHELL ["conda", "run", "-n", "capstone", "/bin/bash", "-c"]

# Install libraries to environment:
RUN conda install -y -c conda-forge tensorflow=1.5.0 keras=2.2.4 opencv=3.4.2 && \
    conda install -y -c powerai imageai

