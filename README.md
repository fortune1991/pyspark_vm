# IAC set-up to create VM installed with Pyspark

## Instructions

This repo contains all of the code nesscessary to simplify the process of creating a GCP VM installed with Pyspark, ready for data processing. Please note, you will need to have Terraform and the Google SDK installed on your machine. 

Once all of the prerequesties are installed, please follow the below instructions step by step to get started

Note: Any values listed in CAPS will need to be updated by the user

1. Open Google Cloud Console, and if you haven't already create a service account with the following permissions:
    - compute admin
    - storage admin
    - BigQuery admin
   
   Use this account to generate a json credentials file

2. Update the variables.tf file with the data requested Upload your credentials json file to a folder called "keys" in the root directory. Make sure this is included in .gitignore

3. Run `terraform init` and then `terraform apply` to create the GCP infrastructure

4. Once the VM has been created via Terrafom, we need to SSH onto the machine (with port forwarding), uplaod the config scripts to the VM, make the scripts executable and run the script as below:

    1. `gcloud config set project PROJECT_ID`
    2. `gcloud compute scp setup_vm.sh create_spark_kernel.sh MACHINE_NAME:~/ --zone=GCP_ZONE_NAME`
    3. `gcloud compute ssh MACHINE_NAME --zone=GCP_ZONE_NAME -- -L 8888:localhost:8888`
    4. If you get the message `channel 3: open failed: connect failed: Connection refused` in the terminal, just ctrl + c and ignore. This is because the port is listening for Jupyter which hasn't been installed or launched yet
    5. `chmod +x ~/setup_vm.sh ~/create_spark_kernel.sh`
    6. `./setup_vm.sh`

5. Now once set-up is complete, it will say "Starting Jupyter Labs" at the bottom of the terminal. Run the logfile to find the URL token `cat jupyter.log`
6. Open the URL token from within the log file, which should open up the Jupyter console. Example URL here: "http://127.0.0.1:8888/lab?token=6d5a585e239a4846b304e50be607afb5d78d9d9e82761973"
7. Select the new Python(Spark) kernel and create a new notebook
8. Paste the following boiler plate code at the top of the notebook to create a new pyspark session
    ```
    import pyspark
    from pyspark.sql import SparkSession

    # Create spark session
    spark = SparkSession.builder \
        .master("local[*]") \
        .appName('test') \
        .getOrCreate()
    ```
