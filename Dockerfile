FROM continuumio/miniconda3 as prob_2_notebook_image
WORKDIR /app
COPY environment.yml .
RUN conda env create -f environment.yml
SHELL ["conda", "run", "-n", "selise_venv", "/bin/bash", "-c"]
COPY train_infer_pipeline_prob_2.ipynb .
ENTRYPOINT ["conda", "run", "--no-capture-output", "-n", "selise_venv", "jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--NotebookApp.token=''", "--NotebookApp.password=''",  "--allow-root", "--no-browser"]



FROM continuumio/miniconda3 as prob_3_image
WORKDIR /app
COPY environment.yml .
RUN conda env create -f environment.yml
SHELL ["conda", "run", "-n", "selise_venv", "/bin/bash", "-c"]
COPY Scripts/prob_3.py .
ENTRYPOINT ["conda", "run", "--no-capture-output", "-n", "selise_venv", "python3", "prob_3.py"]


# command for running docker image
# docker run --gpus=all -p 8888:8888 -v ${PWD}/docker_mount:/tmp docker_notebook