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

`docker build -t capstone:<version_number> .`

Step 2: Run the container

`docker run --name capstone -it -p 8000:8000 capstone:<version_number>`

Step 3: Activate the environment and run the test

`conda actiavte capstone` - you should see something like 
this `(capstone) root@01f1f79e0b32:/CSCE-482/app/#`

Next `python manage.py runserver 0.0.0.0:8000` to run

## Training on GPU Cluster

These instructions will get you a copy of the project up and running on A&M's 
High Performance Research Computing (HPRC) clusters for development and testing 
purposes. See deployment for notes on how to deploy the project on a live system. 

Step 1: Login to `<username>@terra.tamu.edu` and run the commands below to set up 
the environment

```
cd $SCRATCH
module load Anaconda/3-5.0.0.1
conda create -y --name capstone python=3.6
source activate capstone
```

Step 2: Install all the required packages
```
conda install -y -c conda-forge keras=2.2.4 opencv=4.2 && \
conda install -y -c anaconda tensorflow-gpu=1.4 cudnn=6.0.21 cudatoolkit=8.0 && \
conda install -y -c powerai imageai=2.1.5
```

*can check package installation with:\* 
`conda list | grep 'cuda\|tensorflow\|opencv\|keras\|imageai'`

Step 3: Pull the repo into your home directory
```
cd ~
git clone https://github.com/Ac65943/CSCE-482-Dianoga.git
git checkout beta
```

Step 4: Submit job to cluster (make sure to adjust the memory
`#SBATCH --mem=5120M` and wall clock limit `#SBATCH --time=03:00:00`
accordingly)

`sbatch Beta01GPU.slurm`

Can see information about job with: `squeue -u <netID>`

## Django Tutorial

The web application was created using Django. Main purpose of the web application is to collect images of trash and plastic from people at Texas A&M. The data will be used to improve the data model and accuracy.

### Installation
Download Miniconda installer from https://docs.conda.io/en/latest/miniconda.html

Once Miniconda is done installing, open Anaconda Prompt and type in the following command.
```bash
conda install -c anaconda django
```
Check if Django is properly installed by typing
```bash
python
import django
print(django.get_version())
```
First redirect into the correct directory and create a Django project
```bash
django-admin startproject <project_name>
```

### Basics
The outer datasite/ is the root directory.

manage.py is the command-line utility that lets you interact with the Django project in various ways.

The inner datasite/ is the directory contains the actual Python package for the project.

datasite/__init__.py is the empty file that tells Python that this directory should be considered a Python package.

datasite/settings.py contains the settings or configurations for the Django project.

datasite/urls.py contains the URL declarations for Django project.

datasite/asgi.py is an entry-point for ASGI-compatible web servers to serve the project.

datasite/wsgi.py is an entry-point for WSGI-compatible web servers to serve the project.

### Build
In order to build the code (if not working) delete the db.sqlite3 file
```bash
python manage.py makemigrations

python manage.py migrate --run-syncdb
```

### Run
In order to run, the project redirect into the root trash_handler folder and type the following command.
```bash
python manage.py runserver
```

If you want to change the port to port 8080 then type following command
```bash
python manage.py runserver 0.0.0.0:<port>
```

## Running the tests

```bash
curl -v -F "file=@/path/to/image.jpg/" capstone.murtazahakimi.com/predict/
```

## Flutter
### Download
First download the Flutter SDK from the main Flutter development website.

For windows: https://flutter.dev/docs/get-started/install/windows

For macOS: https://flutter.dev/docs/get-started/install/macos

For linux: https://flutter.dev/docs/get-started/install/linux

Follow the website instructions on how to add the path to your local machine.

Download Android Studio from https://developer.android.com/studio and follow the flutter instructions on the setup for Android Studio.

### Set up on Android
In order to run the Flutter app on an Android device:
1. Enable Developer options on your device
2. Window devices must install the Google USB Driver from https://developer.android.com/studio/run/win-usb.
3. Must plug in the device to your local machine.
3. Run **flutter devices** in terminal or command prompt.

### Set up on Local Machine
For testing and running a Flutter app on your local machine using an Android emulator.
1. Enable VM acceleration. Instructions on enabling on different platforms are at https://developer.android.com/studio/run/emulator-acceleration.
2. Launch **Android Studio > Tools > AVD Manager** and select **Create Virtual Device**. For device definition select Pixel XL and then click **Next**. For the system image select **Q** and click **Next**.
3. Under Emulated Performance, select **Hardware- GLES 2.0** to enable hardware acceleration.
4. Verify the settings and click **Finish**.
5. In the AVD Manager, click **Run**.

### Working on project
When pulling the project, within the recycle folder type the following command in the command prompt or terminal:
```
flutter packages get
```

Run the project with the command while running the emulator or device
```
flutter devices
```

## Built With

* [TBD](http://www.google.com) - TBD
* [TBD](http://www.google.com) - TBD
* [TBD](https://www.google.com) -TBD 

## Authors

* **Murtaza Hakimi** - *TBD* - [MRTZA](https://github.com/MRTZA)
* **Murtaza Hakimi** - *TBD* - [Ac65943](https://github.com/Ac65943)
* **Murtaza Hakimi** - *TBD* - [Unknown](https://github.com/)
* **Murtaza Hakimi** - *TBD* - [Unknown](https://github.com/)



