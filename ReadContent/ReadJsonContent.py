import json

def read_request_content():
    file=  open('C:/Z-Udhayakumar/Udhayakumar/APIAutomationRepository/API_Automation/InputData/Request.json','r')
    jsonfile=file.read()
    json_content=json.loads(jsonfile)
    return json_content


