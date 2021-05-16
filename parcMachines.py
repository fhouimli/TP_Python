import csv


def listAllMachines(nomFichier):
    fichier = open(nomFichier, "r")
    print(fichier.read())
    fichier.close()

#listAllMachines("listMachines.txt")

class Machines:
    def __init__(self, nom, ip, cpu, ram, ddr, os):
        self.nom = nom
        self.ip = ip
        self.cpu = cpu
        self.ram = ram
        self.ddr = ddr
        self.os = os
    
def addMachine(nomFichier):
    # saisir les infos machine
    nom1 = str(input("entrez le nom de la machine: "))
    ip1 = str(input("entrez l'adresse ip: "))
    cpu1 = str(input("entrez le nombre de CPU: "))
    ram1 = str(input("entrez la taille de la RAM: "))
    ddr1 = str(input("entrez le nombre des disques et la taille: "))
    os1 = str(input("entrez l'OS et la version: "))
    
    # construire l'instance machine            
    machine1 = Machines(nom1, ip1, cpu1, ram1, ddr1, os1)
    # écriture dans un fichier
    fichier = open(nomFichier, "a")
    fichier.writelines('\n'+machine1.nom+", "+machine1.ip+", "+machine1.cpu+", "+machine1.ram+", "+machine1.ddr+", "+machine1.os)
    fichier.close()
    
#addMachine("listMachines2.txt")

def find(hostname, nomFichier):
    with open(nomFichier, 'rt') as fichier:
         reader = csv.reader(fichier, delimiter=',')
         line_count = -1
         line_found = -1
         for line in reader:
                line_count +=1
                if hostname == line[0]: 
                  line_found = line_count
    print ('le hostname existe dans la ligne N° '+str(line_found))
    return line_found


def listMachineByHostname(nomFichier):
    hostname = input("entrez le nom de la machine: ")
    isHostname = False
    fichier = open(nomFichier,"r")
    for ligne in fichier:
        if hostname in ligne:
            isHostname = True
            print(ligne)
    if isHostname == False:
        print("le hostname saisi n'existe pas")
    fichier.close()
    
#listMachineByHostname("listMachines.txt")

def deleteMachine(hostname, nomFichier):
    fichier = open(nomFichier, "r")
    lines = fichier.readlines()
    fichier.close()
    #supprimer ligne
    position = find(hostname, nomFichier)
    if position != -1:
        del lines[position]
    #réecrir fichier apres suppression ligne
    fichier = open(nomFichier, "w+")
    for line in lines:
        fichier.write(line)
    fichier.close()
    return position

def deleteMachineByHostname(nomFichier):
    hostname = input("entrez le nom de la machine à supprimer: ")
    deleteMachine(hostname, nomFichier)   
  
    
def modifMachineByHostname(nomFichier):
    hostname = input("entrez le nom de la machine à modifier: ")
    position = deleteMachine(hostname, nomFichier) 
    if position != -1:
        print("entrez les nouvelles informations")
        addMachine(nomFichier)
            
#modifMachineByHostname("listMachines.txt")

############Main##################
nomFichier = "listMachines.txt"
choix = input("entrer votre choix: 1: afficher toutes les machines, 2: ajouter, 3: afficher par hostname, 4: modifier, 5: supprimer : ")
if choix == "1":
    listAllMachines(nomFichier)
elif choix == "2":
    addMachine(nomFichier)
elif choix == "3":
    listMachineByHostname(nomFichier)
elif choix == "4":
    modifMachineByHostname(nomFichier)
elif choix == "5":
    deleteMachineByHostname(nomFichier)
else:
    print("le choix n'est pas valide ")
