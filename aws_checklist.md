# Amazon Web Services - Step By Step Instructions


## Prerequisite

- [ ] register for a free AWS account (you have to provide credit card details)
- [ ] sign into the [AWS Management Console](https://console.aws.amazon.com/console/home) (https://console.aws.amazon.com/console/home)
- [ ] select the *EU(Frankfurt)* region in the upper right corner

---

## 1. AWS RDS Database configuration (in the AWS Management Console)

- [ ] Go to *Services* - *RDS*
- [ ] Click on *Create database*
- [ ] Select *PostgreSQL* and the *Free tier* template
- [ ] Choose an arbitrary instance identifier
- [ ] Choose a master username for your PostgreSQL database
- [ ] Choose a master password for your PostgreSQL database
- [ ] Disable *storage autoscaling*
- [ ] Click on *Additional connectivity configuration* and switch *Publicly accessible* to *Yes*
- [ ] Click on *Additional configuration* and disable *Enable automatic backups* and *Enable Performance Insights*
- [ ] Finally, click on *Create database*

> Make sure that you know the database connection details:

- public hostname/ ip-address/ endpoint
- database username
- database password

---

## 2. Security Rules For DB Instance (in the AWS management console)

- [ ] in the overview of your database under *Connectivity & Security* click on the security group (something like `default(sg-...)`)
- [ ] click on *Inbound rules*
- [ ] click on *Edit inbound rules*
- [ ] click on *Add rule*
- [ ] Select *All traffic* under *Type* and *Anywhere* under *Source*
- [ ] click on *Save rules*

> You should now be able to login to your remote database via `psql -U username -h hostname`

---

## 3. AWS EC2 Server (in the AWS management console)

- [ ] Go to *Services* - *EC2*
- [ ] Click on *Launch instance*
- [ ] Choose *Ubuntu Server 18.04* as your OS and click on *Select*
- [ ] Choose the *t2.micro* instance and click on *Next:Configure Instance Details*
- [ ] Click on *Next: Add Storage*
- [ ] Choose 20GB of storage under *Size(GiB)*
- [ ] Click on *Next: Add Tags*
- [ ] Click on *Next: Configure Security Group*
- [ ] Click on *Add Rule*
- [ ] Select *HTTP* under *Type* and *Anywhere* under *Source*
- [ ] Also add port `5432` and port `27017` (for next week's project)
- [ ] Click on *Review and Launch*
- [ ] Review your settings and click on *Launch*
- [ ] In the pop up window select *Create a new key pair* and give the key the name *aws_key*
- [ ] Download the key
- [ ] Click on *Launch instances*

> Make sure that you know the server connection details:

- public hostname/ ip-address
- server username (`ubuntu`)
- your private keyfile (`aws_key.pem`)

---

## 4. Metabase installation on EC2 Server (in a terminal window)

- [ ] open a terminal window (bash/wsl)
- [ ] move the downloaded keyfile to the `~/.ssh` folder: `cp ~/Downloads/aws_key.pem ~/.ssh/`
- [ ] navigate to the folder where your private keyfile is stored
- [ ] change the permissions of the keyfile: `chmod 600 ~/.ssh/aws_key.pem`
- [ ] log into the server via ssh: `ssh -i ~/.shh/aws_key.pem ubuntu@<hostname>`
- [ ] you can now control the server via a shell terminal window
- [ ] check for updates `sudo apt-get update -y`
- [ ] install the updates `sudo apt-get upgrade -y`
- [ ] install java `sudo apt-get install -y openjdk-11-jre-headless`
- [ ] download the metabase installer `wget https://downloads.metabase.com/v0.40.3.1/metabase.jar`
- [ ] start metabase server in the background `sudo nohup java -jar -DMB_JETTY_PORT=80 metabase.jar &`
- [ ] you can check if the proces is running by starting the task manager: `htop` 

> You should now be able to visit your metabase by typing in the hostname/ip of your ec2-server in your browser

---

## Next Steps

- In your **terminal**:
  - [ ] Create a sql dump of your local data with `pg_dump` (https://www.postgresql.org/docs/9.1/backup-dump.html)
    - `pg_dump -h localhost -p 5432 -U postgres -d northwind > northwind.sql`
  - [ ] Import the data in the remote AWS database with `psql` and the `-f` option
  
- In your **web-browser**:
  - [ ] Connect Metabase to your RDS Database Server
  - [ ] Create some figures and a public Dashboard in Metabase