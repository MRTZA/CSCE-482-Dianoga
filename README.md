# CSCE-482 Dianoga: Trash Handler

Our project, the Dianoga Trash Handler, is a system that will automatically classify 
trash based on recyclability and make sure it ends up in the correct bin. Our 
solution aims to address challenges caused by human error (i.e. throwing trash in 
the wrong bin). It will use a camera to take a picture of a piece of trash. The 
picture will be fed into a machine learning model that will classify the trash 
based on recyclability. In the final prototype, the system will have hardware 
peripherals that direct the trash into the correct bin, for example by opening 
the trash lid or by some other mechanism that physically puts the trash into the bin.


## Getting Started

These instructions will get you a copy of the project up and running on your local 
machine for development and testing purposes. See deployment for notes on how to 
deploy the project on a live system. 

Step 1: Build Docker image (while in the repo directory)

`docker build -t capstone:v0.1 .`

Step 2: Run the container (fill in the absolute path to your repo)

`docker run --name capstone -it -v "/path/to/repo/":"/CSCE-482/" capstone:v0.1`

Step 3(i): If running `predict.py` update the parameters in the file and use the 
command below

`conda actiavte capstone` - you should see something like this `(capstone) root@01f1f79e0b32:/CSCE-482#`

Next `cd /CSCE-482/` and `python predict.py` to run

Step 4(i): If training...

`TODO`

## Running the tests

TODO

## Deployment

TODO

## Built With

* [TBD](http://www.google.com) - TBD
* [TBD](http://www.google.com) - TBD
* [TBD](https://www.google.com) -TBD 

## Authors

* **Murtaza Hakimi** - *TBD* - [MRTZA](https://github.com/MRTZA)
* **Murtaza Hakimi** - *TBD* - [Ac65943](https://github.com/Ac65943)
* **Murtaza Hakimi** - *TBD* - [Unknown](https://github.com/)
* **Murtaza Hakimi** - *TBD* - [Unknown](https://github.com/)



