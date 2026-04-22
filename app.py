from flask import Flask, request, jsonify, render_template
from flask_cors import CORS
import subprocess
import re

app = Flask(__name__)
CORS(app)

# =========================
# Routes
# =========================

@app.route('/')
def home():
    return render_template('index.html')


@app.route('/evaluate')
def evaluate():
    action = request.args.get('action')

    try:
        process = subprocess.run(
            ["swipl", "-s", "main.pl", "-g", f"test({action}),halt."],
            capture_output=True,
            text=True
        )

        if process.returncode != 0:
            return jsonify({
                "error": "Prolog execution failed",
                "details": process.stderr
            })

        parsed = parse_output(process.stdout)
        return jsonify(parsed)

    except Exception as e:
        return jsonify({"error": str(e)})

@app.route('/actions')
def get_actions():
    return jsonify([
        "steal_food",
        "lie_to_protect",
        "harm_in_self_defense",
        "cheat_in_exam",
        "bribe_official",
        "tell_truth_harshly",
        "save_multiple_people",
        "sacrifice_one_to_save_many"
    ])


# =========================
# Helper Functions
# =========================

def parse_output(output):
    result = {}

    lines = output.strip().split("\n")

    for line in lines:
        line = line.strip()

        match = re.match(
            r"(judge|citizen|utilitarian):\s*(\w+)\s*-\s*(.+)",
            line.lower()
        )

        if match:
            framework = match.group(1)
            decision = match.group(2).upper()
            reason = match.group(3).strip()

            result[framework] = [decision, reason]

    return result


# =========================
# Run App
# =========================

if __name__ == '__main__':
    app.run(debug=True)