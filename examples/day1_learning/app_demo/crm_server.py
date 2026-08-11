from flask import Flask,jsonify
from pathlib import Path

app = Flask(__name__)

CRM_ROOT = Path.home() / "crm_root"

@app.route("/make_dir/<client_id>",methods=["GET"])
def make_dir(client_id):
    folder=CRM_ROOT/client_id
    folder.mkdir(parents=True,exist_ok=True)

    return jsonify({
        "Success":"True",
        "folder": str(folder)
    })

app.run(host="0.0.0.0",port=5000)
