# rtpipe for demo with RISE
FROM caseyjlaw/rtpipe

RUN apt-get update && apt-get install -y git
RUN conda install -y jupyter
RUN jupyter migrate

# install RISE
WORKDIR /home
RUN git clone https://github.com/damianavila/RISE && cd RISE && python setup.py install

WORKDIR /ipynb
CMD jupyter notebook --no-browser --ip=0.0.0.0 --notebook-dir=/ipynb
