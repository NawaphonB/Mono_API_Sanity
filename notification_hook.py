import json
import requests
import xml.etree.ElementTree as ET

output_file = r"C:\Users\UsEr\Documents\GitHub\Mono_API_Sanity\Monoapi\results\output.xml"
webhook_url = "https://chat.googleapis.com/v1/spaces/AAQAgsuVSX4/messages?key=AIzaSyDdI0hCZtE6vySjMm-WEfRq3CPzqKqqsHI&token=Q5RYEKvbZHPX6hRrTIv0kSnb3nSHAerxbO1AFULNBzg"

tree = ET.parse(output_file)
root = tree.getroot()

fail_count = 0
total_count = 0

for stat in root.findall(".//stat"):
    if stat.attrib.get("fail") and stat.attrib.get("pass"):
        fail_count += int(stat.attrib["fail"])
        total_count += int(stat.attrib["fail"]) + int(stat.attrib["pass"])

if fail_count > 0:
    message = {
        "text": f"🚨 Health check alert!!\n❌ {fail_count} test(s) failed out of {total_count}.\n📂"
    }
else:
    message = {
        "text": f"✅ Everything look fine!! \nAll {total_count} tests passed successfully!\n📂"
    }

requests.post(webhook_url, data=json.dumps(message), headers={'Content-Type': 'application/json'})