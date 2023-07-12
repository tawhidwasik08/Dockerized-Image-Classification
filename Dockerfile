FROM continuumio/miniconda3 as notebook_image
WORKDIR /app
COPY environment.yml .
RUN conda env create -f environment.yml
SHELL ["conda", "run", "-n", "ic_venv", "/bin/bash", "-c"]
COPY classification_train_infer_pipeline.ipynb .
ENTRYPOINT ["conda", "run", "--no-capture-output", "-n", "ic_venv", "jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--NotebookApp.token=''", "--NotebookApp.password=''",  "--allow-root", "--no-browser"]

# command for running docker image
# docker run --gpus=all -p 8888:8888 -v ${PWD}/docker_mount:/tmp docker_notebook