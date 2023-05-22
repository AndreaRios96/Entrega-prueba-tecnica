from flask import Flask, request, json
import mysql.connector
from mysql.connector import Error
import json
from flask_cors import CORS, cross_origin
from datetime import datetime


### Conexion a BD LOCAL
def dataBaseSQL():
    myDB = mysql.connector.connect(
        host = "localhost",
        user = "root",
        passwd = "root",
        database = "monitoring_system"  
    )
    return myDB

app = Flask(__name__)
cors = CORS(app) 
app.config['CORS_HEADERS']=['Content-Type']

@app.route("/monitoring_system/get-list-data", methods=['POST']) # Crea una notificación con los DATOS BASICOS
@cross_origin()
def GenerateData():

    myDB = dataBaseSQL()
    cur = myDB.cursor()

    try:
        query = f"SELECT DISTINCT ip, hostname, permemory, percpu, perdisk, timenow FROM monitoring ORDER BY timenow desc;"
        cur.execute(query)
        devices = cur.fetchall()

    except Error as ex:
        print("Error durante la conexion:", ex)
        return json.dumps({"response" : False})

    vecMemory = []
    vecCpu = []
    vecDisk = []
    vecHost = []
    vecIP = []
    Count = []
    for i in range(len(devices)):
        vecIP.append(devices[i][0])
        vecMemory.append(devices[i][2])
        vecCpu.append(devices[i][3])
        vecDisk.append(devices[i][4])
        vecHost.append(devices[i][1])


    for i in vecIP:
        try:
            query2 = f"SELECT COUNT(namevariable) FROM alarms WHERE ip='{i}';"
            cur.execute(query2)
            counts = cur.fetchall()
            Count.append(counts[0][0])

        except Error as ex:
            print("Error durante la conexion:", ex)
            return json.dumps({"response" : False})    

    myDB.close()
    return json.dumps({"devices" : devices, 'vecMemory':vecMemory, 'vecCpu':vecCpu, 'vecDisk':vecDisk, 'vecHost':vecHost, 'Count':Count}, default=str)

if __name__ == "__main__": 
    app.run(debug=True, port=4000)