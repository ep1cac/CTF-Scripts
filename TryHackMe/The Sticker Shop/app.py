from flask import Flask, request


app = Flask(__name__)

@app.route('/', methods=['POST', 'OPTIONS'])
def handler():
    if request.method == 'OPTIONS':
        headers = {
                'Access-Control-Allow-Origin' : '*',
                'Access-Control-Allow-Methods' : 'POST, OPTIONS',
                'Access-Control-Allow-Headers' : 'Content-Type'
            }
        return '', 200, headers

    elif request.method == 'POST':
        data = request.get_json()
        print(data)
        return '', 200

    return '', 405

if __name__ == '__main__':
    app.run()