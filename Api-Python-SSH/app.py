import paramiko
from ping3 import ping, verbose_ping
import mysql.connector
from mysql.connector import Error
import time
import re
import requests


### Conexion a BD LOCAL
def dataBaseSQL():
    myDB = mysql.connector.connect(
        host = "localhost",
        user = "root",
        passwd = "root",
        database = "monitoring_system"  
    )
    return myDB

### Funcion para obtener los comandos
def DeleteRegisters():
    vector = []
    myDB = dataBaseSQL()
    cur = myDB.cursor()
    try:
        query = f"DELETE FROM monitoring;"
        cur.execute(query)
        myDB.commit()
        myDB.close()

    except Error as ex:
        print("Error durante la conexion:", ex)

### Funcion para obtener los datos de los equipos
def dataMachines():

    vector = []
    myDB = dataBaseSQL()
    cur = myDB.cursor()
    try:
        query = f"SELECT ip, username, PASSWORD FROM machines;"
        cur.execute(query)
        devices = cur.fetchall()
        if len(devices) > 0:
            for i in range (len(devices)):
                temp = []
                for j in range (len(devices[i])):
                    temp.append(devices[i][j])          
                vector.append(temp)
        myDB.close()
        return vector
    except Error as ex:
        print("Error durante la conexion:", ex)

### Funcion para obtener los comandos
def dataCommands():
    vector = []
    myDB = dataBaseSQL()
    cur = myDB.cursor()
    try:
        query = f"SELECT ip, hostname, MEMORY, CPU, DISK  FROM comands WHERE TYPE='linux';"
        cur.execute(query)
        commands = cur.fetchall()
        for i in range (len(commands[0])):
            vector.append(commands[0][i])
        myDB.close()
        return vector

    except Error as ex:
        print("Error durante la conexion:", ex)

### Funcion que realiza la conexion mediante SSH
def ConexionSSH(matrizMachines, vectorCommands):


    try:
        for i in range (len(matrizMachines)):
            # print(matrizMachines[i])
            try:
                temp = ""
                data = []
                for j in range (len(vectorCommands)):
                    host = matrizMachines[i][0]
                    port = 22
                    username = matrizMachines[i][1]
                    password = matrizMachines[i][2]

                    ### Creamos la instancia de SSHClient
                    client = paramiko.SSHClient()

                    ### Ajusta la política de host por defecto para aceptar claves SSH desconocidas
                    client.set_missing_host_key_policy(paramiko.AutoAddPolicy())

                    try:
                        #### Conexion al equipo remoto
                        client.connect(hostname=host, port=port, username=username, password=password)

                        ### Ejecutamos el comando 'lscpu'
                        stdin, stdout, stderr = client.exec_command(vectorCommands[j])

                        ### Lectura de la salida del comando
                        output = stdout.read().decode()

                    finally:
                        ### Cerrar conexión SSH
                        client.close()    

                    if j == 4:
                        temp = str(MinData(output.strip()))
                        data.append(temp)
                    else:
                        data.append(output.strip())        
                insertData(data)
                for k in range(2, len(data)):
                    if float(data[k]) >= 75:
                        match k:
                            case 2: Warnings([data[0], data[1], 'Memmory Ram', data[k]])
                            case 3: Warnings([data[0], data[1], 'CPU', data[k]])
                            case 4: Warnings([data[0], data[1], 'Disk Capacity', data[k]])
            except Error as ex:
                print("Error durante la conexion:", ex)

    except Error as ex:
        print("Error durante la conexion:", ex)

### Funcion que realiza mineria de datos al comando 4 = sumas %CPUs
def MinData(output):
    suma = 0
    # Buscar los números antes del '%' utilizando expresiones regulares         
    numeros = [int(numero) for numero in re.findall(r'(\d+)%', output) if numero]
    # Sumar los números
    suma = sum(numeros)
    return(suma)

### Funcion que inserta los datos en la tabla 'monitoring' para tener el historico
def insertData(vector):
    myDB = dataBaseSQL()
    cur = myDB.cursor()
    try:
        query = f"INSERT INTO monitoring (ip, hostname, permemory, percpu, perdisk, timenow) VALUES ('{vector[0]}', '{vector[1]}', '{vector[2]}', '{vector[3]}', '{vector[4]}', NOW());"
        cur.execute(query)
        myDB.commit()
    except Error as ex:
        print("Error durante la conexion:", ex)

    try:
        query = f"INSERT INTO historical (ip, hostname, permemory, percpu, perdisk, timenow) VALUES ('{vector[0]}', '{vector[1]}', '{vector[2]}', '{vector[3]}', '{vector[4]}', NOW());"
        cur.execute(query)
        myDB.commit()
    except Error as ex:
        print("Error durante la conexion:", ex)

    myDB.close()

### Funcion que inserta las alarmas de las variables que superan el porcentaje 75%
def Warnings(vector):
    myDB = dataBaseSQL()
    cur = myDB.cursor()
    try:
        query = f"INSERT INTO alarms (ip, hostname, namevariable, percentage, hora) VALUES ('{vector[0]}', '{vector[1]}', '{vector[2]}', '{vector[3]}', NOW());"
        print(query)
        cur.execute(query)
        myDB.commit()
        myDB.close()
    except Error as ex:
        print("Error durante la conexion:", ex)

    try:
        requests.post('https://api.telegram.org/bot5844775345:AAEoAqvZ6bVqIxhG7q-0838nzPI_CvNpk-A/sendMessage', data={'chat_id':'@SistemaMonitoreo', 'text':f'Se presenta alarma en el equipo {vector[1]} con ip {vector[0]}, superando el umbral en {vector[2]} con {vector[3]}% de uso.'})
    except Error as ex:
        print("Error durante la conexion:", ex)

while True:
    DeleteRegisters()
    matrizMachines = dataMachines()
    vectorCommands = dataCommands()
    ConexionSSH(matrizMachines, vectorCommands)
    print('En espera 5 minutos')
    time.sleep(300)
    print()

