import json
import requests
import xml.etree.ElementTree as ET

output_file = r"C:\Users\UsEr\Documents\GitHub\Mono_API_Sanity\Monoapi\results\output.xml"
webhook_url = "https://chat.googleapis.com/v1/spaces/AAQAgsuVSX4/messages?key=AIzaSyDdI0hCZtE6vySjMm-WEfRq3CPzqKqqsHI&token=Q5RYEKvbZHPX6hRrTIv0kSnb3nSHAerxbO1AFULNBzg"

tree = ET.parse(output_file)
root = tree.getroot()

fail_count = 0
total_count = 0
failed_tests = []

# ✅ Each <test> is a test case
for test in root.findall(".//test"):
    total_count += 1
    test_name = test.attrib.get("name", "Unnamed Test")
    status_tag = test.find("./status")
    if status_tag is not None and status_tag.attrib.get("status") == "FAIL":
        fail_count += 1
        failed_tests.append(test_name)

print(f"Fail count: {fail_count}, Total count: {total_count}")
print("Failed tests:", failed_tests)

if fail_count > 0:
    failed_list = "\n".join([f"- {name}" for name in failed_tests])
    message = {
        "text": f"🚨 Health check alert!!\n❌ {fail_count} test(s) failed out of {total_count}.\n\nFailed tests:\n{failed_list}\n📂"
    }
    response = requests.post(webhook_url, data=json.dumps(message), headers={'Content-Type': 'application/json'})
    print(f"Webhook response: {response.status_code}, {response.text}")
else:
    print("✅ No failures detected. No message sent.")
    