FROM python:3
RUN apt-get update
RUN apt-get install --assume-yes vim
RUN pip3 install PyYAML filemagic

#RUN git clone https://github.com/labgrid-project/labgrid /opt/labgrid
RUN git clone -b deifmaster https://github.com/kjeldflarup/labgrid.git /opt/labgrid
RUN cd /opt/labgrid && python3 setup.py install

