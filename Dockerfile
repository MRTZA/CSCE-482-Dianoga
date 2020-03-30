FROM continuumio/miniconda

# Create the environment:
RUN apt-get update && \
    conda create -y --name capstone python=3.6

# Make RUN commands use the new environment:
SHELL ["conda", "run", "-n", "capstone", "/bin/bash", "-c"]

# Install libraries to environment:
RUN conda install -y -n root conda=4.6
RUN conda install -y -c conda-forge keras=2.2.4 opencv=4.2 tensorflow=1.4 && \
    conda install -y -c anaconda django=3.0.3 && \
    conda install -y -c powerai imageai=2.1.5

# Copy the repo into the container:
COPY ./ /CSCE482/

# Start the app
EXPOSE 8000
WORKDIR /CSCE482/trash_handler