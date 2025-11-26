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
        # Extract error message from keyword or test failure
        error_msg = status_tag.text.strip() if status_tag.text else "Unknown error"
        # Also check for keyword errors within the test
        keyword_errors = []
        for kw in test.findall(".//kw"):
            kw_status = kw.find("./status")
            if kw_status is not None and kw_status.attrib.get("status") == "FAIL":
                kw_name = kw.attrib.get("name", "Unknown Keyword")
                kw_error = kw_status.text.strip() if kw_status.text else "Keyword error"
                keyword_errors.append(f"🔴 {kw_name}: {kw_error}")
        failed_tests.append({
            "name": test_name,
            "error": error_msg,
            "keyword_errors": keyword_errors
        })

if fail_count > 0:
    # Build detailed error message with keyword errors
    failed_details = []
    for test in failed_tests:
        test_info = f"📌 *{test['name']}*\n"
        test_info += f"   • Error: {test['error']}\n"
        if test['keyword_errors']:
            test_info += "   • Keyword Errors:\n"
            for kw_error in test['keyword_errors']:
                test_info += f"     {kw_error}\n"
        failed_details.append(test_info)
    
    failed_list = "\n".join(failed_details)
    message = {
        "text": f"🚨 *Health Check Alert!*\n❌ {fail_count} test(s) failed out of {total_count}\n\n{failed_list}"
    }
    response = requests.post(webhook_url, data=json.dumps(message), headers={'Content-Type': 'application/json'})
