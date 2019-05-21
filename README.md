running-janusgraph-on-ubuntu
==========================

Provides the docker-compose scripts and configuration files along with
instructions on howe to install and run Janusgraph on an ubuntu 18 LTS machine

 

Requirements
------------

Docker-Compose must be installed on your machine. See [Install
Compose](https://docs.docker.com/v17.09/compose/install/)

After installation, it is recommended that you assign 4 cores and at least 6GB
of memory to Docker using the Docker application settings.

 

 

![](https://github.com/sadams-rti-org/running-janusgraph-locally/blob/master/details/janusgraph-logo-small.png)

Instructions for installing and using JanusGraph
------------------------------------------------

1.  Open a Terminal or Powershell window, depending on your platform

2.  Navigate to where you want to install JanusGraph

3.  Clone this repository, renaming it as desired

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
git clone https://github.com/sadams-rti-org/running-janusgraph-locally
mv running-janusgraph-locally my-janusgraph
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

4.  Use one the following commands as desired to run/stop JanusGraph:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
./janus-up
./janus-down
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

5.  Once you have run JanusGraph, all your data is stored in the ./details/data
    folder. The next time you start JanusGaph, it will attach to this data
    automatically. If you desire to erase this data and start over, use the
    following command:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
./janus-erase
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


 
