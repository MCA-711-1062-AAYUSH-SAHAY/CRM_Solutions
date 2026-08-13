
<img width="1536" height="1024" alt="adeb88d4-c85c-41ef-968c-f2996f490313" src="https://github.com/user-attachments/assets/ee37f4d5-1e06-4688-b3d3-9e5a2ef2319e" /><br/>
### Line-by-line meaning

```python
from flask import Flask, jsonify
```

Import Flask to create the web server and `jsonify` to return JSON.

```python
from pathlib import Path
```

Imports `Path` for working with files/folders.

```python
app = Flask(__name__)
```

Creates the Flask application.

```python
CRM_ROOT = Path.home() / "crm_root"
```

Sets the main folder as:

```text
Termux home/crm_root
```

```python
@app.route("/make_dir/<client_id>", methods=["GET"])
```

Creates an API endpoint:

```text
/make_dir/123
```

`123` becomes `client_id`.

```python
def make_dir(client_id):
```

Function that runs when the API is called.

```python
folder = CRM_ROOT / client_id
```

Builds the target path:

```text
crm_root/123
```

```python
folder.mkdir(parents=True, exist_ok=True)
```

Creates the folder.

* `parents=True` → create missing parent folders.
* `exist_ok=True` → don't give an error if folder already exists.

```python
return jsonify({
    "Success": "True",
    "folder": str(folder)
})
```

Returns a JSON response containing success and the created folder path.

```python
app.run(host="0.0.0.0", port=5000)
```

Starts the Flask server on **port 5000**.

`0.0.0.0` means it accepts connections from other devices on the network, not just the phone itself.
