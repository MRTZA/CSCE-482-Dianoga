#!/bin/bash
##ENVIRONMENT SETTINGS; CHANGE WITH CAUTION
#SBATCH --export=NONE                #Do not propagate environment
#SBATCH --get-user-env=L             #Replicate login environment

##NECESSARY JOB SPECIFICATIONS
#SBATCH --job-name=Beta01GPU         #Set the job name to "Beta01GPU"
#SBATCH --time=03:00:00              #Set the wall clock limit to 3hrs
#SBATCH --ntasks=1                   #Request 1 task
#SBATCH --mem=5120M                  #Request 5120MB (5GB) per node
#SBATCH --output=Beta01GPUOut.%j     #Send stdout/err to "Beta01GPUOut.[jobID]"
#SBATCH --gres=gpu:1                 #Request 1 GPU per node can be 1 or 2
#SBATCH --partition=gpu              #Request the GPU partition/queue

##OPTIONAL JOB SPECIFICATIONS
#SBATCH --mail-type=ALL              #Send email on all job events
#SBATCH --mail-user=taza18@tamu.edu  #Send all emails to email_address 

# Set up environment
cd $SCRATCH
ml purge
module load Anaconda/3-5.0.0.1
source activate capstone

#First Executable Line
cd ~/CSCE-482-Dianoga/
python train.py
