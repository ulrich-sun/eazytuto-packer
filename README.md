1 1.1 1- ı ı

by uırich NOUMSI

# Objectifs
Builder des AMI pour nos cloud Provider, afin de gagner du temps dans le provisionnement de nos differentes stack
Que ce soit dans le cadre d'une entreprise ou de travail personnel
# Prerequis
- installation de Packer
- installation de Terraform
- Avoir un Compte d'un cloud Provider (AWS dans notre cas) + des access key et secret key de disponibles
- installer aws cli sur votre serveur ou votre poste de travail


# Recuperation du code source
Pour recuperer le code source vous avez deux Options
- la premiere est de cloner tout simplemenet le repos
    ```bash 
    git clone https://github.com/ulrich-sun/eazytuto-packer.git
    ```
- la seconde est de realiser un fork
l'avantage d'un fork est que vous pouvez me proposer des ameliorations sur mon code 

# Lancement de la stack
## Build de l'AMI
```bash
cd eazytuto-packer
packer init eazytuto.pkr.hcl && packer fmt eazytuto.pkr.hcl && packer validate eazytuto.pkr.hcl  && packer build eazytuto.pkr.hcl
```

## Creation d'une instance aws
- recuperer la nouvelle AMI
- remplacer au niveau du code terraform
- lancer la creation de l'instance
```bash
cd eazytuto-packer/terraform
terraform init 
terraform plan
terraform apply -auto-approve
```

Patienter quelques Minutes en fonction de la puissance de votre machine et de votre connexion internet

# Test de la VM
- recuperer l'adresse ip qui s'affiche a l'ecran
- connecter vous sur la VM via un outils de connexion lecher SSH (mobaxterm, Putty) ou utiliser tout simplement votre cmd ou CLI
```bash
ssh centos@adresse_ip
```
- entrer le mot de passe: eazytuto
- une fois connecter checker si jenkins est up and running
```bash
docker ps 
```
- ouvrer un navigateur et coller votre adresse_ip:8080

## Resultat
![resultat_connexion](image.png)
![jenkins](image-1.png)