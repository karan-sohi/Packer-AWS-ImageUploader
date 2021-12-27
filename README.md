# Packer-AWS-ImageUploader
This project creates an image on the AWS that contains the entire web stack software including reverse proxy, web app, file storage, and database. The application is a node app 
that allows people to upload an image. The image get stored in the mongo database because the app has ejs frontend and mongo database. 

The image.pkr.hcl is a main packer file that setup an AMI for the application and copy the required files on to the VM instance. The script file demo.sh has all the commands
required to run on the linux instance to setup the application. 

# Run the application
- Fill in the access_key and secret_key from AWS into the image.pkr.hcl
- Run "packer build app.pkr.hcl"
- Set up new EC2 instance from the image
- Visit the URL on your browser (Make sure you allow traffic on port 80 for nginx)
